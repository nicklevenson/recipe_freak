class SessionControllersController < ApplicationController

  get '/login' do
    erb :'sessions/new.html'
  end

  post '/login' do
    
    user = User.find_by_email(params[:user][:email])
    
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/users/home'
    else
      @error = "Incorrect username or password"
      erb :'sessions/new.html'
    end
  end

  delete '/logout' do 
    session.clear
    redirect '/'
  end

end
