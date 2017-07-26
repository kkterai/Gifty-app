class ItemSerializer < ActiveModel::Serializer
  attributes :name
  has_many :list_items
end
