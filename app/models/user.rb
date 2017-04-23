class User < ApplicationRecord
  has_many :lists
  has_many :products, through: :lists
  
  #Products are either desired gifts or products to be shopped for
  has_secure_password

end
