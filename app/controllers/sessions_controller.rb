class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.username}!"
      redirect_to '/home'
    else
      flash[:alert] = "Uh oh, we didn't find a match. please try again."
      redirect_to '/login'
    end
  end

  def create_facebook
    user = User.find_or_create_by(:uid => auth['uid']) do |u|
        u.username = auth['info']['name']
        u.email = auth['info']['email']
      end
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.username}!"
      redirect_to '/home'
    else
      flash[:alert] = "Uh oh, something went wrong. please try again."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
