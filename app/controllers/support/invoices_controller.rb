class Support::InvoicesController < ApplicationController

  def create
    @invoice = Invoice.new invoice_params
    @order = Order.find params[:order_id]
    @invoice.order = @order
    @invoice.user = current_user
    if @invoice.save
      redirect_to new_invoice_payment_path(@invoice), notice: 'pay me'
    else
      render 'camapign/show'
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:amount)
  end
end
