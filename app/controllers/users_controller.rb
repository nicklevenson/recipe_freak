class UsersController < ApplicationController

  get "/users/home" do
   
    if session[:user_id]
      @recipes = current_user.recipes
      erb :"/users/show.html"
    else
      @error = "Please log in or sign up to view this content"
      erb :"/users/show.html"
    end
  end

  get "/signup" do
    erb :"/users/new.html"
  end

  post "/signup" do
    user = User.new(params[:user])
    if user.save 
      session[:user_id] = user.id
      redirect "/users/home"
        
    else 
      @error = user.errors.full_messages.join(" - ")
      erb :'/users/new.html'
    end
  end
end
