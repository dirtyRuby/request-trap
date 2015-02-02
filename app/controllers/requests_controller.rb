class RequestsController < ApplicationController

  def show
    trap_id = params[:trap_id]
    self_id = params[:id]
    @request = Request.where(["id = ?",  self_id])
  end
end
