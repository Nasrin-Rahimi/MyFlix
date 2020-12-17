class User < ApplicationRecord
  belongs_to :plan
  has_many :invitations
  has_many :payments
  has_many :reviews
  has_many :videos, through: :reviews 

  has_secure_password

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, numericality: { only_integer: true }, allow_nil: true
  validates :phone_number, length: { is: 10}, allow_blank: true

  # validates :email, uniqueness: true
  # validates :name, :login, :email, presence: true
  # validates :registration_number, length: { is: 6 }, allow_blank: true
  # validates :points, numericality: true, allow_nil: true
  # validates :games_played, numericality: { only_integer: true }
end
