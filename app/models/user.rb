class User < ApplicationRecord

  has_many :products #Products are either desired gifts or products to be shopped for
  has_secure_password

end
