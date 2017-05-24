class Sku < ApplicationRecord
  belongs_to :order, optional: true

  validates :item, presence: true
  validates :unit, presence: true
  validates :amount, presence: true
end
