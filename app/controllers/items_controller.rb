class ItemsController < ApplicationController
  before_action :authorize

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

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
