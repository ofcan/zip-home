class StartupshipsController < ApplicationController
  
  before_filter :find_startup
  before_filter :assert_current_user
  before_filter :assert_startupship_or_admin
  
  def index
  end

  private

  def find_startup
    @startup = Startup.find(params[:startup_id])
  end

end
