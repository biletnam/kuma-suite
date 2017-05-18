class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_staff?

  def show
    @user = User.find(params[:id])
  end

  def index
    @admin = User.all.where(is_admin: true)
    @staff = User.all.where(is_staff: true)
    @clients = User.all.where(is_client: true)
  end

  def user_is_staff?
    unless current_user.is_staff?
      redirect_to root_path, alert: 'Unauthorized access'
    end
  end
end
