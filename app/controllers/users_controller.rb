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
    @users = User.all.order("username ASC")
    respond_to do |f|
      f.html
      f.json {render json: @users}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
