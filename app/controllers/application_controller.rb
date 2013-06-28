class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  def current_user
    if session[:user_id].present?
      @current_user ||= User.includes(:videos).find(session[:user_id])
    end
  end

  def authenticate_user!
    unless current_user
      redirect_to new_session_url, notice: "Please log in to continue."
    end
  end

  def require_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_url
    end
  end

end
