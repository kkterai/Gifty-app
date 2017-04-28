class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      user.create_list(name: "My Wish List")
      flash[:notice] = "Welcome #{user.username}!"
      redirect_to '/home'
    else
      flash[:alert] = user.errors.full_messages.to_sentence
      redirect_to '/signup'
    end
  end

  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
