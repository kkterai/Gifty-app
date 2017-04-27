class Item < ApplicationRecord

  has_many :list_items
  has_many :lists, through: :list_items
  has_many :store_items
  has_many :stores, through: :store_items

  validates :name, presence: true
  validates_uniqueness_of :name


end
