class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present? && current_user.active?
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section."
      redirect_to login_path
    end
  end

  def require_admin
    require_login
    return if performed?

    unless current_user.administrator?
      flash[:alert] = "Access restricted to Administrators only."
      redirect_to root_path
    end
  end
end