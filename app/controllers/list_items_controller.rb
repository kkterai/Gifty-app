class ListItemsController < ApplicationController
  before_action :authorize
  before_action :set_list_item, only: [:show, :update, :edit]

  def create

  end

  def show
    @list = current_user.list
  end

  def edit
    @list = current_user.list
  end

  def update
    if @list_item.update(list_item_params)
      redirect_to '/home'
    else
      flash[:alert] = "please try again"
      redirect_to '/home'
    end
  end

  def destroy
    ListItem.find(params[:id]).destroy
    redirect_to '/home'
  end

  private

  def set_list_item
    @list_item = ListItem.find(params[:id])
  end

  def list_item_params
    params.require(:list_item).permit(:details)
  end

end
