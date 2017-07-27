class ListSerializer < ActiveModel::Serializer
  attributes :id, :list_items

  belongs_to :user
  #has_many :list_items
  
  def list_items
    object.list_items.map do |li|
      {
        id: li.id,
        details: li.details,
        purchased: li.purchased,
        comments: li.comments
      }
    end
  end
end
