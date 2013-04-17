class StartupsController < ApplicationController

  def index
  end

  def show
    @startup = Startup.find(params[:id])
  end

end
