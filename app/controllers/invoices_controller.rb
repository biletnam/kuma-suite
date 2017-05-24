class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_staff?

  def create
    order = Order.find params[:order_id]

    if order.publish!
      redirect_to order, notice: 'Order is invoiced!'
    else
      redirect_to order, notice: "Can't publish order "
    end
  end

  private

  def user_is_staff?
    unless current_user.is_staff?
      redirect_to root_path, alert: 'Unauthorized access'
    end
  end
end
