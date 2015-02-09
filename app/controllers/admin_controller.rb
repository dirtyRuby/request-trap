class AdminController < ApplicationController
  skip_before_action :authorize
  #
  # Show current time
  #
  def clock
    @time = Time.now.strftime("%F %T")
    render partial: 'admin/time'
  end
  #
  # GET/admin
  #
  def index
    @new_traps = Trap.where("created_at > ?", session[:logout_time].to_datetime)
  end
end
