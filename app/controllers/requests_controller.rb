class RequestsController < ApplicationController
  def index
    @requests = Request.find(params[:trap_id].order(:request_date))
  end

  def show
    @requests = Request.find(params[:trap_id]).requests.order(:request_date)
  end
end
