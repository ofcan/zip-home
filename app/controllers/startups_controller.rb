class StartupsController < ApplicationController

  def index
  end

  def show
    @startup = Startup.find(params[:id])
  end

  def new
    @startup = Startup.new
  end

  def create
    @startup = Startup.new(params[:startup])
    @startupship = Startupship.new(:user => current_user,
                                   :startup => @startup)
    if @startup.save && @startupship.save
      redirect_to @startup, notice: 'Startup created.'
    else
      render :new
      flash.now[:alert] = 'Startup not created.'
    end
  end

end
