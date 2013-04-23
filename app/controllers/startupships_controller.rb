class StartupshipsController < ApplicationController
  
  before_filter :find_startup
  before_filter :assert_current_user
  before_filter :assert_startupship_or_admin
  
  def index
    @searched_users = User.search(params[:search])
  end

  def create
    @startupship = @startup.startupships.build
    @startupship.startup = @startup
    @startupship.user = User.find(params[:startupship][:user_id])
    if @startupship.save
      redirect_to startup_startupships_path(@startup)
      flash[:notice] = 'Member added.'
    else
      redirect_to startup_startupships_path(@startup)
      flash[:alert] = 'Member not added.'
    end
  end

  private

  def find_startup
    @startup = Startup.find(params[:startup_id])
  end

end
