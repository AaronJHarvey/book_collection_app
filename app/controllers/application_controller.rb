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

  get '/books/:id/edit' do
    @book = Book.find_by_id(params[:id])
    erb :'/books/edit'
  end

  patch '/books/:id' do
    book = Book.find_by_id(params[:id])
    if book.update(title: params[:title], author: params[:author])
      redirect "/books/#{book.id}"
    else
      redirect '/books/new'
    end
  end

  delete '/books/:id' do
    book = Book.find_by_id(params[:id])
    if book
      book.delete
    end
    redirect '/books'
  end

end
