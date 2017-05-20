class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessor :profile_pic

  has_many :comment
  has_many :tickets, dependent: :nullify


    def full_name
      "#{first_name} #{last_name}".strip
    end
end
