class UserSerializer < ActiveModel::Serializer
  attributes :username, :email
  has_many :selections
  has_many :list_items, through: :selections
end
