class RequestsController < ApplicationController
  #skip_before_action :authorize
  #
  # View detailed information about certain request by id.
  #
  def new
    @request = Request.find_by
  end

  def show
    @request = Request.find_by(id: params[:id])
  end

  def destroy
    @request = Request.find_by(id: params[:id])
    respond_to do |format|
      format.html { redirect_to 'traps/:trap_id/requests', notice: "Request with ID #{@request.id} successfully deleted."}
    end
  end
end
