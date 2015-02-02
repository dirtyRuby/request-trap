class TrapsController < ApplicationController
  def index
    @traps = Trap.all.order(created_at: :desc)
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

  def capture_request
    if trap = Trap.find_or_create_by(name: params[:trap_id])
      req = trap.requests.create(remote_ip: request.remote_ip, request_method: request.method,
                                 scheme: request.scheme, query_string: request.query_string,
                                 query_params: request.query_parameters,
                                 cookies: request.cookies
      )
    end
  end

  private

end
