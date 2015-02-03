class RequestsController < ApplicationController
  #
  # View detailed information about certain request by id.
  #
  def show
    @request = Request.find_by(id: params[:id])
  end
end
