class Sku < ApplicationRecord
  belongs_to :order

  validates :item, presence: true
  validates :unit, presence: true
  validates :amount, presence: true

  before_save :calculate_sku_total

  def calculate_sku_total
    self.total = self.unit * self.amount
  end

  # def calculate_grand_total
  #   self.grand_total = self.total.all.sum
  # end

end
