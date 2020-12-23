class User < ApplicationRecord
  has_many :reviews
  has_many :videos, through: :reviews 

  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :phone_number, numericality: { only_integer: true }, allow_nil: true, length: { is: 10}

  def self.find_or_create_by_omniauth(auth_hash)
    user = self.where(name: auth_hash["info"]["name"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def admin?
    self.admin
  end

end
