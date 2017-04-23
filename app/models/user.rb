class User < ApplicationRecord

  enum role: [:giver, :recipient]
  has_one :wish_list, class_name: 'List', foreign_key: 'recipient_id'
  has_many :lists, class_name: 'List', foreign_key: 'giver_id'

  validates :username, :password, :email, presence: true
  has_secure_password

end
