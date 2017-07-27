class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :item_name, :purchased, :details, :list_attributes

  belongs_to :list
  belongs_to :item
  has_many :comments
  #has_many :selections
  
  def list_attributes
    object.list.list_items.map do |li|
      {
        id: li.id,
        item_name: li.item.name,
        details: li.details,
        purchased: li.purchased,
        comments: li.comments
      }
    end
  end
    
  def item_name
    object.item.name
  end
end
