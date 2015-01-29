class TrapsController < ApplicationController
  def index
    @traps = Trap.all.order(name: :desc)
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
    trap = Trap.find_or_create_by(name: params[:trap_id])
    data = {ip: request.remote_ip, method: request.method}
    req = trap.requests.create(request_method: request.method, remote_ip: request.remote_ip)
  end

  private

end
