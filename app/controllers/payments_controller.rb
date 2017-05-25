class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_invoice, only: [:new, :create]

  def new
  end

  def create
    customer = create_stripe_customer
    card_info = customer.sources.data[0]
    card_exp = "#{card_info.exp_month}/#{card_info.exp_year}"
    charge = create_stripe_charge(customer)

    update_user(customer, card_info, card_exp)

    if @invoice.update(stripe_charge_id: charge.id)
      flash[:notice] = 'Thanks for the money lol'
      redirect_to @invoice
    else
      flash[:alert] = 'Problem processing Payment'
      redirect_to @invoice
    end
  end

  private

  def find_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end

  def create_stripe_customer
    Stripe::Customer.create(
      description: "Customer for #{current_user.id} | #{current_user.email}",
      source: params[:stripe_token]
    )
  end

  def create_stripe_charge(customer)
    Stripe::Charge.create(
      amount: @invoice.amount * 100,
      currency: "cad",
      customer: customer.id,
      description: "Invoice ID #{@invoice.id} payment"
    )
  end

  def update_user(customer, card_info, card_exp)
    current_user.update(
      stripe_customer_id: customer.id,
      stripe_card_brand: card_info.brand,
      stripe_last4: card_info.last4,
      stripe_card_expiry: card_exp
    )
  end
end
