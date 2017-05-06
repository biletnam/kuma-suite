class Department < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :tickets, dependent: :destroy
end
