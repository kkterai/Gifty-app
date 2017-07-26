class Item < ApplicationRecord

  has_many :list_items
  has_many :lists, through: :list_items
  
  validates :name, presence: true
  validates_uniqueness_of :name

  serialize :name
end
