class UsersController < ApplicationController
  
  def index
    @founders = User.where(:role => 'founder').all
    @advisors = User.where(:role => 'advisor').all
    @mentors = User.where(:role => 'mentor').all
    @team_members = User.where(:role => 'zip_team_member').all
    @basic_users = User.where(:role => 'basic').all
  end

  def show
    @user = User.find(params[:id])
  end
  
end
