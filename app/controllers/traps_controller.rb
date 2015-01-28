class TrapsController < ApplicationController
  def index
    @requests = Request.all
  end

  def capture
  end
end
