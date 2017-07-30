class User < ApplicationRecord

  has_one :list
  has_many :authorizations
  has_many :selections
  has_many :list_items, through: :selections

  validates :username, :password, :email, presence: true
  validates_length_of :password, :minimum => 5

  serialize :username

  has_secure_password

# make method to format username
end
