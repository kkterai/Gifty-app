class Item < ApplicationRecord

  has_many :store_items
  has_many :stores, through: :store_items
  #Products are either gifts to be given or items to be shopped for
end
