class Order < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :skus, dependent: :destroy
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true

  validates :skus, length: { minimum: 1, maximum: 10, message: 'Please supply 1 to 10 SKUs' }
  validates :amount, numericality: { greater_than: 0 }

  include AASM
  aasm whiny_transitions: false do
    state :work_order, initial: true
    state :invoice
    state :cancelled
    state :closed

    event :publish do
      transitions from: :work_order, to: :invoice
    end

    event :paid do
      transitions from: :invoice, to: :closed
    end

    event :cancel do
      transitions from: :invoice, to: :cancelled
    end
  end
end
