class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home

  end

  def index

  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    !!current_user
  end

  def authorize
    redirect_to '/login' unless current_user
  end

end
