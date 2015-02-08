class AdminController < ApplicationController
  skip_before_action :authorize

  def index
    @new_traps = Trap.where("created_at > ?", session[:logout_time].to_datetime)
  end
end
