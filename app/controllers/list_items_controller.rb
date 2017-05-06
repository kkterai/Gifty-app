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

  def destroy
    ListItem.find(params[:id]).destroy
    redirect_to current_user.list
  end

  private

  def set_list_item
    @list_item = ListItem.find(params[:id])
  end

  def list_item_params
    params.require(:list_item).permit(:name)
  end

end
