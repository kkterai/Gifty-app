class Item < ApplicationRecord

  has_many :list_items
  has_many :lists, through: :list_items
  has_many :store_items
  has_many :stores, through: :store_items

  validates :name, presence: true
  validates_uniqueness_of :name

  # def self.top_ten_most_popular_items
  #   byebug
  #   self.select("item_id, count(item_id)").group(item_id)
  # end
end
