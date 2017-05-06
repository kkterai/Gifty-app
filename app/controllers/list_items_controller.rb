class ListItemsController < ApplicationController
  before_action :authorize
  before_action :set_list_item, only: [:update, :edit]


  def edit
  end

  def update
    if @list_item.update(list_item_params)
      redirect_to '/home'
    else
      flash[:alert] = "please try again"
      render '/home'
    end
  end

  private

  def set_list_item
    @list_item = Item.find(params[:id])
  end

  def list_item_params
    params.require(:list_item).permit(:name)
  end

end
