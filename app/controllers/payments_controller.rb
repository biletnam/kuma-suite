class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @invoice = Invoice.find params[:invoice_id]
  end

  def create
    customer = Stripe::Customer.create(
      :description => "Customer for #{current_user.id} | #{current_user.email}",
      :source => params[:stripe_token]
    )
    card_info = customer.sources.data[0]
    exp = "#{card_info.exp_month}/#{card_info.exp_year}"
    current_user.update stripe_customer_id: customer.id,
                        stripe_card_brand: card_info.brand,
                        stripe_last4: card_info.last4,
                        stripe_card_expiry: exp

    @invoice = Invoice.find params[:invoice_id]
    charge = Stripe::Charge.create(
      :amount => @invoice.amount * 100,
      :currency => "cad",
      :customer => customer.id,
      :description => "Invoice ID #{@invoice.id} payment"
      )
      @invoice.update stripe_charge_id: charge.id
      redirect_to @invoice, notice: 'Thanks for the money lol'
  end
end
