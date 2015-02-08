class SessionsController < ApplicationController
  skip_before_action :authorize
  before_action      :first_user, except: :new

  def new
    if session[:user_id] && user = User.find_by(id: session[:user_id])
      redirect_to '/', notice: "User #{user.user_name} already logged in."
    end
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:logout_time] = Time.now
    redirect_to admin_path, notice: "User logged out."
  end

  private
  def first_user
    User.create(user_name: params[:user_name], password: params[:password]) if User.count.zero?
  end
end
