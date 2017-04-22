class Product < ApplicationRecord
  belongs_to :giver, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :store_products
  has_many :stores, through: :store_products
  #Products are either gifts to be given or items to be shopped for
end
