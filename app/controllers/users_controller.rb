class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def index
    @admin = User.all.where(is_admin: true)
    @staff = User.all.where(is_staff: true)
    @users = User.all.where(is_client: true)
  end

end
