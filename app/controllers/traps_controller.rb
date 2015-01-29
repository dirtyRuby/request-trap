class TrapsController < ApplicationController
  def index
    @traps = Trap.all.order(:name)
  end

  def capture
  end
end
