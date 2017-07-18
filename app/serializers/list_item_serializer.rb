class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :purchased, :details
  belongs_to :list
  belongs_to :item
end
