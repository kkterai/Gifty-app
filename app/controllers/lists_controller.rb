class ListsController < ApplicationController

  before_filter :authorize
  before_action :set_list, only: [:show, :update, :edit]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end