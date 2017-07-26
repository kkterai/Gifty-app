class CommentSerializer < ActiveModel::Serializer
  attributes :content
  belongs_to :list_item

end
