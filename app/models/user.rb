class User < ApplicationRecord

  enum role: [:giver, :recipient]
  has_one :list
  has_many :authorizations
  has_many :selections
  has_many :list_items, through: :selections


  validates :username, :password, :email, presence: true
  validates_length_of :password, :minimum => 5

  has_secure_password

  def self.search(username)
   if username.blank?
     self.all
   else
     self.all.where("username LIKE ?", "%#{username}%")
   end
 end

end
