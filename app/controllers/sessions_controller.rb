class SessionsController < ApplicationController
<<<<<<< HEAD
  def new; end

  def create
    user = User.find_by(email: params[:email]&.downcase&.strip)

    if user&.authenticate(params[:password])
      if user.active?
        session[:user_id] = user.id
        if user.administrator?
          redirect_to admin_users_path, notice: "Signed in successfully.", status: :see_other
        else
          redirect_to root_path, notice: "Signed in successfully.", status: :see_other
        end
      else
        flash.now[:alert] = "Your account is currently inactive."
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  rescue StandardError => e
  Rails.logger.error "Login exception: #{e.message}"
  flash.now[:alert] = "An unexpected error occurred. Please try again later."
  render :new, status: :unprocessable_entity
end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Signed out successfully.", status: :see_other
  end
end
=======
  def new
  end

  def create
  end

  def destroy
  end
end
>>>>>>> 05edbb2529e47c264ecfe3a980c118e24c0ae272
