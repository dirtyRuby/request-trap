class SessionsController < ApplicationController
  skip_before_action :authorize
  #before_action      :first_user, except: :new

  def new
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_path
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_path, notice: "User logged out."
  end
=begin
  private
  def first_user
    User.create(user_name: params[:user_name], password: params[:password]) if User.count.zero?
  end
=end
end
