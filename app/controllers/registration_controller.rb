class RegistrationController < ApplicationController
  get '/signup' do
    erb :'/registration/signup'
  end

  post '/signup' do
    user = User.new(name: params["name"], email: params["email"], password: params["password"])
    if user.save
      session[:id] = user.id
      redirect '/books'
    else
      redirect '/signup'
    end
  end

end
