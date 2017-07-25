class SelectionSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :user
  belongs_to :list_item
 
end
