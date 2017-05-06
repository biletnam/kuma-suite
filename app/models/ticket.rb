class Ticket < ApplicationRecord
  belongs_to :department
  belongs_to :user
  # has_many :comments, dependent: :destroy
  # has_many :votes, dependent: :destroy
  # has_many :voters, through: :votes, source: :user
  # has_many :taggings, dependent: :destroy
  # has_many :tags, through: :taggings
  # before_save :capitalize_title

  validates :title, { presence: true }
  validates :body, { presence: true}
  validates :department, { presence: true }

end
