class Product < ApplicationRecord
  belongs_to :user
  #Products are either gifts to be given or items to be shopped for
end
