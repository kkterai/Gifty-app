class ListItemsController < ApplicationController
  before_action :authorize
  before_action :set_list_item, only: [:show, :update, :edit]

  def create
  
  end

  def show
    @list = current_user.list
    @comment = @list_item.comments.build
    @comments = @list_item.comments
    respond_to do |format|
      format.html
      format.json {render json: @list_item }
    end
  end

  def edit
    @item = @list_item.item
  end

  def update
    if @list_item.update(list_item_params)
      redirect_to @list_item.list
    else
      flash[:alert] = "please try again"
      redirect_to @list_item.list
    end
  end

  def destroy
    @list = ListItem.find(params[:id]).list
    ListItem.find(params[:id]).delete
    redirect_to @list
  end

  private

  def set_list_item
    if params[:id]
        @list_item = ListItem.find(params[:id])
    else
        @list_item = ListItem.find(params[:list_item_id])
    end
  end

  def list_item_params
    params.require(:list_item).permit(:details)
  end

end
