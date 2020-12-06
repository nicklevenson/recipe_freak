class UsersController < ApplicationController

  get "/users/home" do
   
    if session[:user_id]
      @recipes = current_user.recipes
      erb :"/users/show.html"
    else
      @error = "Please log in or sign up to view this content"
      erb :'/sessions/new.html'
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

  post "/users/like" do
    if logged_in? 
      user = User.find(session[:user_id])
      recipe = Recipe.find(params[:recipe_id])
      if (user.likes.select{|like|like.recipe.id == recipe.id}) == []
        like = Like.new
        recipe.likes << like
        user.likes << like
        redirect '/'
      end
    else
      @recipes = Recipe.all
      @like_error = "Sign in or sign up to like recipes!"
      erb :welcome
    end
  end

  delete '/users/like' do
    user = User.find(session[:user_id])
    recipe = Recipe.find(params[:recipe_id])
    like = Like.find_by(user_id: user.id, recipe_id: recipe.id)
    like.destroy
    redirect '/'
  end
end
