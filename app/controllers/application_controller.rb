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

    get '/books/:id' do
      @book = Book.find_by_id(params[:id])

      if @book
        erb :'/books/show'
      else
        redirect '/books'
      end
    end
end
