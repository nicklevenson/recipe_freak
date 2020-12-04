class UsersController < ApplicationController

  get "/users/home" do
   
    if session[:user_id]
      @user = User.find(session[:user_id])
      erb :"/users/show.html"
    else
      @error = "Please log in or sign up to view this content"
      erb :'welcome'
    end
  end

  get "/signup" do
    erb :"/users/new.html"
  end

  post "/signup" do
    user = User.new(params[:user])
    if User.exists?(username: user.username) || User.exists?(email: user.email) 
      @error = "Username or email already exists" 
      erb :'/users/new.html'
    
    else
      if user.save 
        session[:user_id] = user.id
        redirect "/users/home"
        
      else 
        @error = user.errors.full_messages.join(" - ")
        erb :'/users/new.html'
      end
    end
  
  end

end
