class Order < ApplicationRecord
  has_many :invoices, dependent: :nullify
  belongs_to :user

end
