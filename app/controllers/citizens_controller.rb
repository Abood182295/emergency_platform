class CitizensController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(citizen_params)
    
    if @user.save
      # بعد نجاح التسجيل، يوجهك لصفحة تسجيل الدخول
      redirect_to login_path, notice: 'تم تسجيل حسابك بنجاح! تفضل بتسجيل الدخول.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def citizen_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end