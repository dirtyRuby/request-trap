class TrapsController < ApplicationController
  skip_before_action :authorize, only: :capture_request
  #
  # List all available traps action.
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

  def show
    if @trap = Trap.find_by_name(params[:trap_id])
      @requests = @trap.requests.order(created_at: :desc)
    else
      respond_to do |format|
        format.html { redirect_to '/', notice: "No trap #{params[:trap_id]} found."}
      end
    end
  end

  def destroy
    Trap.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to '/traps', notice: 'Trap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  #
  # Capture trap/request and save to database action.
  #
  def capture_request
    trap = Trap.find_or_create_by(name: params[:trap_id])
    if trap
      req = trap.requests.create(remote_ip: request.remote_ip, request_method: request.method,
                                 scheme: request.scheme, query_string: request.query_string,
                                 query_params: request.query_parameters,
                                 cookies: request.cookies, headers: request.headers["Content-Type"]
      )
    end
  end
end
