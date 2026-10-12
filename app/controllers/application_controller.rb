class ApplicationController < ActionController::Base
<<<<<<< HEAD
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
=======
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
>>>>>>> 05edbb2529e47c264ecfe3a980c118e24c0ae272
