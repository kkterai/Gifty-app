class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :list_id, :item_id, :purchased, :details

  belongs_to :list
  belongs_to :item
  has_many :selections
  has_many :users, through: :selections

end
