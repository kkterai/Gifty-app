class ListItem < ApplicationRecord

  belongs_to :list
  belongs_to :item
  has_many :selections
  has_many :users, through: :selections

  accepts_nested_attributes_for :selections

  # def self.top_ten_most_popular_items
  #   self.all.where("item_id, count(item_id)").group(item_id)
  # more sql
  # end
end
