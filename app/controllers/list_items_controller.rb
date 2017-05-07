class ListItemsController < ApplicationController
  before_action :authorize
  before_action :set_list_item, only: [:show, :update, :edit]

  def create

  end

  def show
    @list = current_user.list
    @list_2 = List.find(params[:list_id])
  end

  def edit
    @list = current_user.list
  end

  def update
    if @list_item.update(list_item_params)
      redirect_to
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
    params.require(:list_item).permit(:details)
  end

end
