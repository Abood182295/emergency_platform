class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @role = current_user.role
  end

  def role
    requested_role = params[:role]
    return authorize_role!(requested_role) unless current_user.role == requested_role

    @role = requested_role
    render :show
  end
end
