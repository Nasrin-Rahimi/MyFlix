class User < ApplicationRecord
  belongs_to :plan, optional: true
  # belongs_to :plan, -> { where active: true }
  has_many :invitations
  has_many :payments
  has_many :reviews
  has_many :videos, through: :reviews 

  has_secure_password

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, numericality: { only_integer: true }, allow_nil: true
  validates :phone_number, length: { is: 10}, allow_blank: true

  def self.find_or_create_by_omniauth(auth_hash)
    user = self.where(name: auth_hash["info"]["name"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

end
