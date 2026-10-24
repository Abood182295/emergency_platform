class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    return if current_user

    redirect_to login_path, alert: "يرجى تسجيل الدخول أولاً للوصول إلى هذه الصفحة."
  end

  def authorize_role!(required_role)
    return if current_user&.role == required_role

    render "sessions/access_denied", status: :forbidden
  end
end
