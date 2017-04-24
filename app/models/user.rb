class User < ApplicationRecord

  enum role: [:giver, :recipient]
  has_one :list

  validates :username, :password, :email, presence: true
  has_secure_password

end
