class Store < ApplicationRecord
  has_many :store_items
  has_many :items, through: :store_items

  validates :name, presence: true
  
end
