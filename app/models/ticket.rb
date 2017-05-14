class Ticket < ApplicationRecord
  belongs_to :department
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, { presence: true }
  validates :body, { presence: true}
  validates :department, { presence: true }

end
