class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_invoice, only: [:new, :create]

  def new
  end

  def create
    stripe_payment_service = Payments::CreatePayment.new(
      user:         current_user,
      stripe_token: params[:stripe_token],
      invoice:      @invoice
    )

    if stripe_payment_service.call
      flash[:notice] = 'Thanks for the money lol'
      redirect_to @invoice
    else
      flash[:alert] = 'Problem processing Payment'
      render :new
    end
  end

  private

  def find_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end
end
