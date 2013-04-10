class ApplicationController < ActionController::Base
  protect_from_forgery

  def assert_admin
    unless current_user.try(:admin)
      redirect_to posts_path
      flash[:alert] = "You can't do that."
    end
  end

end
