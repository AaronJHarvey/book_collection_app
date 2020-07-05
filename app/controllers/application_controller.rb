require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

    get '/books' do
      @books = Book.all
      erb :'books/index'
    end

    get '/books/new' do
      @users = User.all
      erb :'/books/new'
    end

    post '/books' do
      binding.pry
      user = User.find_by_id(params[:user_id])
      book = user.books.build(params)

      if book.save
        redirect '/books'
      else
        redirect '/books/new'
      end
    end

    get '/books/:id' do
      @book = Book.find_by_id(params[:id])

      if @book
        erb :'/books/show'
      else
        redirect '/books'
      end
    end


end
