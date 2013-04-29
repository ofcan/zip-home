class UsersController < ApplicationController
  
  before_filter :find_user, :except => :index

  def index
    @founders = User.where(:role => 'founder').all
    @advisors = User.where(:role => 'advisor').all
    @mentors = User.where(:role => 'mentor').all
    @team_members = User.where(:role => 'zip_team_member').all
    @basic_users = User.where(:role => 'basic').all
  end

  def show
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => 'User updated.'
    else
      flash[:alert] = 'User not updated.'
      redirect_to @user, :alert => 'User not updated.'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
  
end
