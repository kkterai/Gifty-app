class List < ApplicationRecord

  belongs_to :giver, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  has_many :list_items

end
