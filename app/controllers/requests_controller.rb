class RequestsController < ApplicationController

  def show
    self_id = params[:id]
    @request = Request.find_by(id: params[:id])
  end
end
