class User < ApplicationRecord
  belongs_to :plan
  has_many :invitations
  has_many :payments
  has_many :reviews
  has_many :videos, through: :reviews 
end
