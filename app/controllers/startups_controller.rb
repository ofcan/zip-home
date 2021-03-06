class StartupsController < ApplicationController

  before_filter :find_startup, :only => [:show, :edit, :update, :destroy]
  before_filter :assert_current_user, :except => [:show, :index]
  before_filter :assert_startupship_or_admin, :only => [:edit, :update, :destroy]

  layout :set_proper_layout

  def index
    @startups = Startup.all
    @batches = Batch.all.sort_by(&:created_at).reverse
  end

  def show
  end

  def new
    @startup = Startup.new
    @title = 'New startup'
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
    @title = "Edit startup"
  end

  def update
    if @startup.update_attributes(params[:startup])
      redirect_to @startup, notice: 'Startup updated.'
    else
      render :edit
      flash.now[:alert] = 'Startup not updated.'
    end
  end

  def destroy
    @startup.destroy
    redirect_to startups_path, notice: 'Startup destroyed.'
  end

  private

  def find_startup
    @startup = Startup.find(params[:id])
  end

  def set_proper_layout
    case action_name
    when 'new', 'edit'
      'two_column'
    else
      'application'
    end
  end

end
