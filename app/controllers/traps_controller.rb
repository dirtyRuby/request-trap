class TrapsController < ApplicationController
  skip_before_action :authorize, only: :capture_request
  #
  # GET /traps
  #
  def index
    @traps = Trap.all.order(created_at: :desc)
  end
  #
  # List all requests captured by certain trap action.
  #
  def new
    @trap = Trap.new
  end
  #
  # GET /traps/:trap_name/requests
  #
  def show
    if @trap = Trap.find_by_name(params[:trap_name])
      @requests = @trap.requests.order(created_at: :desc)
    else
      respond_to do |format|
        format.html { redirect_to traps_path, notice: "No trap #{params[:trap_name]} found."}
      end
    end
  end
  #
  # PATCH/PUT /traps/:trap_name/requests
  #
  def update
    respond_to do |format|
      if Trap.find_by(id: params[:trap_name]).update(trap_params)
        format.html{redirect_to trap_path, notice: "Trap  was successfully renamed."}
      end
    end
  end
  #
  # DELETE /traps/:trap_name/:id
  #
  def destroy
    Trap.find_by(name: params[:trap_name]).destroy
    respond_to do |format|
      format.html { redirect_to traps_path, notice: 'Trap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  #
  # Capture trap/request and save to database action.
  #
  def capture_request
    trap = Trap.find_or_create_by(name: params[:trap_name])
    if trap
      header = Hash.new
      if request.headers
        request.headers.each { |key, value| header[key] = value.to_s unless value.is_a?(Hash) }
      end
      req = create_request(trap, request.remote_ip, request.method, request.scheme, request.query_string,
                           request.query_parameters, request.cookies, header)
    end

    WebsocketRails[:channel_name].trigger(:request_captured, trap)
  end

  private
  def trap_params
    params.require(:trap).permit(:name)
  end

  def create_request (trap, remote_ip, request_method, scheme, query_string, query_params, cookies, headers=nil)
    trap.requests.create(remote_ip: remote_ip, request_method: request_method,
                   scheme: scheme, query_string: query_string,
                   query_params: query_params, cookies: cookies, headers: headers)
  end
end
