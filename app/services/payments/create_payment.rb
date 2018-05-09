class Payments::CreatePayment
  include Virtus.model

  attribute :stripe_token, String
  attribute :user, User
  attribute :invoice, Invoice

  def call
    ActiveRecord::Base.transaction do
      begin
        update_user && create_stripe_charge && update_pledge
      rescue => error
        Rails.logger.info("Exception happened #{error.message}")
        raise ActiveRecord::Rollback.new
      end
    end
  end

  private

  def create_stripe_customer
    @customer ||= Stripe::Customer.create(
      description: "Customer for #{user.id} | #{user.email}",
      source:      stripe_token
    )
  end

  def create_stripe_charge(customer)
    @charge ||= Stripe::Charge.create(
      amount:      invoice.amount * 100,
      currency:    "cad",
      customer:    @customer.id,
      description: "Invoice ID #{invoice.id} payment"
    )
  end

  def update_user
    card_info = @customer.sources.data[0]

    user.update(
      stripe_customer_id: @customer.id,
      stripe_card_brand:  card_info.brand,
      stripe_last4:       card_info.last4,
      stripe_card_expiry: "#{card_info.exp_month}/#{card_info.exp_year}"
    )
  end

  def update_invoice
    invoice.update(stripe_charge_id: @charge.id)
  end
end
