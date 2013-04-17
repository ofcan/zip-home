class StartupsController < ApplicationController

  before_filter :find_startup, :only => [:show, :edit]
  before_filter :assert_current_user, :only => [:new, :create, :edit]
  before_filter :assert_startupship, :only => [:edit]

  def index
  end

  def show
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

  def edit
  end

  private

  def find_startup
    @startup = Startup.find(params[:id])
  end

  def assert_startupship
    unless find_startupship(current_user, @startup)
      redirect_to startups_path, alert: "You can't do that."
    end
  end

end
