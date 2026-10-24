class SessionsController < ApplicationController
  before_action :redirect_if_signed_in, only: %i[new create]

  def new; end

  def create
    email = params[:email].to_s.strip.downcase
    password = params[:password].to_s

    if email.blank? || password.blank?
      @error = "يرجى إدخال البريد الإلكتروني وكلمة المرور."
      render :new, status: :unprocessable_entity
      return
    end

    user = User.find_by(email: email)
    if user&.authenticate(password)
      reset_session
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "تم تسجيل الدخول بنجاح."
    else
      @error = "البريد الإلكتروني أو كلمة المرور غير صحيحة."
      render :new, status: :unauthorized
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "تم تسجيل الخروج بنجاح.", status: :see_other
  end

  def access_denied
    render :access_denied, status: :forbidden
  end

  private

  def redirect_if_signed_in
    redirect_to dashboard_path if current_user
  end
end
