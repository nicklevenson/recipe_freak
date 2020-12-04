class UsersController < ApplicationController

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"/users/show.html"
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
        redirect "/users/#{user.id}"
        
      else 
        @error = user.errors.full_messages.join(" - ")
        erb :'/users/new.html'
      end
    end
  
  end

end
