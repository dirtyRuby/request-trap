class RequestsController < ApplicationController
  skip_before_action :authorize

  def new
    @request = Request.new
  end
  #
  # GET /traps/:trap_id/requests/:id
  #
  def show
    @request = Request.find_by(id: params[:id])
  end
  #
  # DELETE /traps/:trap_id/requests/:id
  #
  def destroy
    @request = Request.find_by(id: params[:id])
    @request.destroy
    respond_to do |format|
      format.html { redirect_to trap_path, notice: "Request with ID #{@request.id} successfully deleted."}
    end
  end
end
