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

  get '/books' do
    if logged_in?
      @books = current_user.books
      erb :'books/index'
    else
      redirect '/login'
    end
  end

  get '/books/new' do
    if logged_in?
      erb :'/books/new'
    else
      redirect '/login'
    end
  end

  post '/books' do
    if logged_in?
      book = current_user.books.build(params)

      if book.save
        redirect '/books'
      else
        redirect '/books/new'
      end
    else
      redirect '/login'
    end
  end

  get '/books/:id' do
    if logged_in?
      @book = current_user.books.find_by_id(params[:id])

      if @book
        erb :'/books/show'
      else
        redirect '/books'
      end
    else
      redirect '/login'
    end
  end

  get '/books/:id/edit' do
    if logged_in?
      @book = current_user.books.find_by_id(params[:id])
      if @book
        erb :'/books/edit'
      else
        redirect '/books'
      end
    else
      redirect '/login'
    end
  end

  patch '/books/:id' do
    if logged_in?
      book = current_user.books.find_by_id(params[:id])
      if book.update(title: params[:title], author: params[:author])
        redirect "/books/#{book.id}"
      else
        redirect '/books/new'
      end
    else
      redirect '/login'
    end
  end

  delete '/books/:id' do
    if logged_in?
      book = current_user.books.find_by_id(params[:id])
      if book
        book.delete
      end
      redirect '/books'
    else
      redirect '/login'
    end
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      @user ||= User.find_by_id(session[:id]) if logged_in?
    end
  end

end
