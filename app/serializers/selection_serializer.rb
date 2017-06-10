class SelectionSerializer < ActiveModel::Serializer
  attributes :id, :list_item_id

  belongs_to :user
  belongs_to :list_item
  
end
