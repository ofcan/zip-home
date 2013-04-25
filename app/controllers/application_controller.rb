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
      redirect_to root_path
      flash[:alert] = "You can't do that."
    end
  end

  def assert_startupship_or_admin
    unless find_startupship(current_user, @startup) || current_user.admin
      # there is no need for current_user.try(:admin)
      # because we assert_current_user with another before_filter
      redirect_to root_path, alert: "You can't do that."
    end
  end
  
  def find_startupship(user, startup)
    user.startupships.find_by_startup_id(startup)
  end

end
