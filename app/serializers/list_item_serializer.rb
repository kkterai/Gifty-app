class ListItemSerializer < ActiveModel::Serializer
  attributes :purchased, :details

  belongs_to :item
  has_many :comments
  has_many :selections
  
end
