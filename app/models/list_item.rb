class ListItem < ApplicationRecord

  belongs_to :list
  belongs_to :item
  has_many :selections
  has_many :users, through: :selections

  accepts_nested_attributes_for :selections

  def most_popular_items
    ListItem

  end
end
