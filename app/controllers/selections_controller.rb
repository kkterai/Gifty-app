class SelectionsController < ApplicationController

  def create
    list_item_ids = params["list_item_ids"]
    list_item_ids.each do |li|
      selection = Selection.new
      selection.build_user
      selection.user = current_user
      selection.build_list_item
      selection.list_item = ListItem.find_by(id: li)
      selection.save
    end
    redirect_to home_path
  end

end
