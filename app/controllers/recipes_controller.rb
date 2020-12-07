class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    erb :"/recipes/index.html"
  end

  # GET: /recipes/new
  get "/recipes/new" do
    if logged_in?
      erb :"/recipes/new.html"
    else
      @error = "You must log in or sign up to make recipes."
      erb :'/sessions/new.html'
    end
  end

  # POST: /recipes
  post "/recipes" do
    if params[:recipe][:public?] == nil
      params[:recipe][:public?] = false
    else
      params[:recipe][:public?] = true
    end
    recipe = Recipe.create(params[:recipe])
    User.find(session[:user_id]).recipes << recipe
    Cuisine.find_or_create_by(params[:cuisine]).recipes << recipe
    recipe.ingredients << Ingredient.create(params[:ingredient])
    recipe.steps << Step.create(params[:step])
    redirect :'/users/home'
  end

  # GET: /recipes/5
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :"/recipes/show.html"
  end

  # GET: /recipes/5/edit
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :"/recipes/edit.html"
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
    if params[:recipe][:public?] == nil
      params[:recipe][:public?] = false
    else
      params[:recipe][:public?] = true
    end
    recipe = Recipe.find(params[:id])
    recipe.update(params[:recipe])

    Cuisine.find_or_create_by(params[:cuisine]).recipes << recipe

    recipe.ingredients.destroy_all
    recipe.ingredients << Ingredient.create(params[:ingredient])

    recipe.steps.destroy_all
    recipe.steps << Step.create(params[:step])
    redirect "/recipes/#{recipe.id}"
  end

  # DELETE: /recipes/5/delete
  delete "/recipes/:id/delete" do
    recipe = Recipe.find(params[:id])
    if logged_in?
      if session[:user_id] == recipe.user.id
        recipe.destroy
        redirect '/users/home'
      end
    else
      redirect "/recipes"
    end
  end

  post "/recipes/like" do
    if logged_in? 
      user = User.find(session[:user_id])
      recipe = Recipe.find(params[:recipe_id])
      if (user.likes.select{|like|like.recipe.id == recipe.id}) == []
        like = Like.new
        recipe.likes << like
        user.likes << like
        redirect "/recipes/#{recipe.id}"
      end
    else
      recipe = Recipe.find(params[:recipe_id])
      @recipe = recipe
      @like_error = "Sign in or sign up to like recipes!"
      erb :'recipes/show.html'
    end
  end

  delete '/recipes/like' do
    user = User.find(session[:user_id])
    recipe = Recipe.find(params[:recipe_id])
    like = Like.find_by(user_id: user.id, recipe_id: recipe.id)
    like.destroy
    redirect "/recipes/#{recipe.id}"
  end
end
