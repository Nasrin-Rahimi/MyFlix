class User < ApplicationRecord
  belongs_to :plan
  has_many :invitations
  has_many :payments
end
