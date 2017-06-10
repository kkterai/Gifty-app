class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email

  has_many :selections
  has_many :list_items
end
