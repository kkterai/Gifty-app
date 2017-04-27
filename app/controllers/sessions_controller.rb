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
    @authorization = Authorization.find_by_provider_and_uid(auth["provider"], auth["uid"])
    if @authorization
      session[:user_id] = @authorization.user.id
      flash[:alert] =  "Welcome back #{@authorization.user.username}!"
      redirect_to '/home'
    else
      user = User.new :username => auth["info"]["name"], :email => auth["info"]["email"]
      user.authorizations.build :provider => auth["provider"], :uid => auth["uid"]
      user.password = "placeholder"
      if user.save
        session[:user_id] = user.id
        flash[:alert] =  "Welcome #{user.username}!"
        redirect_to '/home'
      else
        flash[:alert] = "Uh oh, something went wrong. please try again."
        redirect_to '/login'
      end
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
