class ApplicationController < ActionController::Base

  protect_from_forgery

  def assert_current_user
    unless current_user
      redirect_to new_user_session_path
      flash[:alert] = "You need to sign in before you can do that."
    end
  end

  def assert_admin
    unless current_user.try(:admin)
      redirect_to posts_path
      flash[:alert] = "You can't do that."
    end
  end
  
  def find_startupship(user, startup)
    user.startupships.find_by_startup_id(startup)
  end

end
