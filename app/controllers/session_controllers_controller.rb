class SessionControllersController < ApplicationController

  get '/login' do
    erb :'sessions/new.html'
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[user_id] = user.id
      redirect '/users/home'
    else
      @error = "Incorrect username or password"
      erb :'sessions/new.html'
    end
  end

  delete '/logout' do 
    
  end

end
