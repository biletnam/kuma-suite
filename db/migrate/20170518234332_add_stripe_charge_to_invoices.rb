class AddStripeChargeToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :stripe_charge_id, :string
  end
end
