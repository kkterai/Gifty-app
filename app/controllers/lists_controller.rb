class ListsController < ApplicationController
  before_action :authorize
  before_action :set_list, only: [:show]


  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def show
    @item = @list.items.build
    @list_items = @list.list_items
    respond_to do |format|
      format.html
      format.json { render json: @list }
    end
  end

  def index
    @lists = List.all
    render json: @lists
  end
  

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :selection_ids[])
  end
end
