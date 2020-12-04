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
      @error = "You must log in or create an account to make recipes."
      erb :'/sessions/new.html'
    end

  end

  # POST: /recipes
  post "/recipes" do
    binding.pry
    
  end

  # GET: /recipes/5
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :"/recipes/show.html"
  end

  # GET: /recipes/5/edit
  get "/recipes/:id/edit" do
    erb :"/recipes/edit.html"
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
    redirect "/recipes/:id"
  end

  # DELETE: /recipes/5/delete
  delete "/recipes/:id/delete" do
    redirect "/recipes"
  end
end
