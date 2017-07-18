class ListSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :list_items

  # belongs_to :user
  # has_many :list_items
  # has_many :items, through: :list_items
  
end
