class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email

  has_one :list
  has_many :selections
  has_many :list_items, through: :selections

end
