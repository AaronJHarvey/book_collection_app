class BooksController < ApplicationController
  get '/books' do
    redirect_if_not_logged_in
      @books = current_user.books
      erb :'books/index'
  end

  get '/books/new' do
    redirect_if_not_logged_in
      erb :'/books/new'
  end

  post '/books' do
    redirect_if_not_logged_in
      book = current_user.books.build(params)

      if book.save
        redirect '/books'
      else
        redirect '/books/new'
      end
  end

  get '/books/:id' do
    redirect_if_not_logged_in
      @book = Book.find_by_id(params[:id])

      if @book
        erb :'/books/show'
      else
        redirect '/books'
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
        if book
          if book.update(title: params[:title], author: params[:author])
            redirect "/books/#{book.id}"
          else
            redirect '/books/new'
          end
        else
          redirect '/books'
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
end
