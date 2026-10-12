<<<<<<< HEAD
module Admin
  class UsersController < ApplicationController
    before_action :require_admin
    before_action :set_user, only: [:edit, :update, :toggle_active]

    def index
      @users = User.order(created_at: :desc)
    end

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "User successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def toggle_active
      @user.update(active: !@user.active)
      status = @user.active? ? "activated" : "deactivated"
      redirect_to admin_users_path, notice: "User account #{status}."
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :role, :active)
    end
  end
end
=======
class Admin::UsersController < ApplicationController
  def index
  end

  def edit
  end

  def update
  end
end
>>>>>>> 05edbb2529e47c264ecfe3a980c118e24c0ae272
