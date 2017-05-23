class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_staff?
  before_action :find_order, only: [:show, :edit, :update, :destroy]


  def index
    @orders = Order.last(20)
  end

  def new
    @order = Order.new
    3.times { @order.skus.build }
    @clients = User.all.where(is_client: true)
  end

  def create
    @order = Order.new order_params
    @order.user = current_user

    if @order.save
      redirect_to order_path(@order)
      flash[:notice] = 'Order posted successfully'
    else
      render :new
      # render 'support/orders/show'
      flash[:alert] = 'Order not created'
    end
  end

  def show
    @order = Order.find params[:id]
    @orders = Order.last(20)
    @duedate = Order.find(params[:id]).created_at+60.day
  end


  private

  def find_order
    @order = Order.find params[:id]
  end

  def order_params
    params.require(:order).permit(:user, {sku_attributes: [:item, :unit, :amount, :id, :_destroy]})
  end

  def user_is_staff?
    unless current_user.is_staff?
      redirect_to root_path, alert: 'Unauthorized access'
    end
  end

end
