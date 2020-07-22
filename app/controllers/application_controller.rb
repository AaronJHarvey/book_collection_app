require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch("APPSECRET")
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      @current_user ||= User.find_by_id(session[:id]) if logged_in?
    end
  end

  def user_being_viewed
    @user_being_viewed ||= User.find_by_id(params[:id])
  end

private
  def redirect_if_not_logged_in
    if !logged_in?
      redirect '/login'
    end
  end

end
