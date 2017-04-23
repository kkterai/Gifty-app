class User < ApplicationRecord

  enum role: [:giver, :receiver]
  has_many :lists
  has_many :items, through: :lists

  #Products are either desired gifts or products to be shopped for
  has_secure_password

end
