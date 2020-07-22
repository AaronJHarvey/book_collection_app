
class UsersController < ApplicationController
  get '/user/:id' do
    if user_being_viewed
      @books = user_being_viewed.books
      erb :'books/index'
    else
      erb :'/error'
    end
  end
end
