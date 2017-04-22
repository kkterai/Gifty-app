class Product < ApplicationRecord
  belongs_to :user
  has_many :store_products
  #Products are either gifts to be given or items to be shopped for
end
