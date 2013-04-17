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
    if @startup.save
      redirect_to @startup, notice: 'Startup created.'
    else
      render :new
      flash.now[:alert] = 'Startup not created.'
    end
  end

end
