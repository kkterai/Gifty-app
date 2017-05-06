class Selection < ApplicationRecord
  belongs_to :user
  belongs_to :list_item

  def delta
    # s1 = Set.new [1, 2]                   # -> #<Set: {1, 2}>
    # s2 = [1, 2].to_set                    # -> #<Set: {1, 2}>
    # s1 == s2                              # -> true
    # s1.add("foo")                         # -> #<Set: {1, 2, "foo"}>
    # s1.merge([2, 6])                      # -> #<Set: {1, 2, "foo", 6}>
    # s1.subset? s2                         # -> false
    # s2.subset? s1                         # -> true
  end

  def wishlist_owner
    self.list_item.list.user
  end

  def wishlist_owner=(user)
    self.list_item.list.user = user
  end
end
