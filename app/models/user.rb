class User < ApplicationRecord

  enum role: [:giver, :recipient]
  has_one :list
  has_many :authorizations

  validates :username, :email, presence: true
  validates :password, presence: true

  has_secure_password

end
