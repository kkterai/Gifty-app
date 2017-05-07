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

  def update #Found!
    @selection.list_item.purchased = true
    @selection.list_item.save
    if @selection.destroy
      redirect_to '/home'
    else
      flash[:alert] = "Something went wrong. Please try again"
      redirect_to '/home'
    end
  end

  def destroy
    Selection.find(params[:id]).destroy
    redirect_to '/home'
  end


  private

  def set_selection
    @selection = Selection.find(params[:id])
  end

  def selection_params
    params.require(:selection).permit(:id)
  end
end
