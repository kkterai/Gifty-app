class Selection < ApplicationRecord
  belongs_to :user
  belongs_to :list_item


  def wishlist_owner
    self.list_item.list.user
  end

  def wishlist_owner=(user)
    self.list_item.list.user = user
  end

  def record_purchase
    list_item.purchased == true
  end

end
