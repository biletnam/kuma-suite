class Sku < ApplicationRecord
  belongs_to :order

  validates :item, presence: true
  validates :unit, presence: true
  validates :amount, presence: true
end
