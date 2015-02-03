class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize, only: :capture_request

  protected
  def authorize
    unless session[:user_name]
      redirect_to admin_path, notice: "Opps, looks like You're not logged in!"
    end
  end
end
