class ItemsController < ApplicationController
  before_action :authorize
  before_action :set_item, only: [:show, :update, :edit, :destroy]

  def create
    @list = List.find_by(id: params[:list_id])
    @list.items.build(item_params)
     if @list.save
       redirect_to @list
     else
       flash[:alert] = "please try again"
       redirect_to @list
     end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to current_user.list
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end

end
