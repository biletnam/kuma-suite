class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_staff?

  def index
    @orders = Order.all
    @staff = User.all.where(is_staff: true).last(10)
  end

  private

  def user_is_staff?
    unless current_user.is_staff?
      redirect_to root_path, alert: 'Unauthorized access'
    end
  end
end
