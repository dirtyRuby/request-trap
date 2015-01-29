class TrapsController < ApplicationController
  def index
    @traps = Trap.all.order(name: :desc)
  end

  def show
    if @trap = Trap.find_by_name(params[:trap_id])
      @requests = @trap.requests.order(created_at: :desc)
    end
  end

  def capture
  end
end
