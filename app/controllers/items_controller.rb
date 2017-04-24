class ItemsController < ApplicationController
  before_action :authorize
  before_action :set_item, only: [:show, :update, :edit]

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    @item.save
    @list_item = ListItem.new(list_id: params[:list_id])
    @list_item.item_id = @item.id
    @list_item.save
    redirect_to @list
  end

  def show
    @item = @item.items.build
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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end

end
