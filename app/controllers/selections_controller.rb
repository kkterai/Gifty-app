class SelectionsController < ApplicationController
  before_action :set_selection, only: [:update]

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

  def update
    raise params.inspect
    if @selection.update(selection_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  private

  def set_selection
    @selection = Selection.find(params[:id])
  end

  def selection_params
    params.require(:selection).permit(:id)
  end
end