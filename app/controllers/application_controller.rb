require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'random_string'
  end

  get "/" do
    @recipes = Recipe.all
    erb :welcome
  end

  post "/sort" do
    if params[:sort] == "recent"
      @last = "Recent-Old"
      @recipes = Recipe.all
      erb :welcome
    elsif params[:sort] == "popular"
      @recipes = Recipe.all.sort_by{|recipe| recipe.likes.count}
      @last = "Popular"
      erb :welcome
    elsif Cuisine.all.collect{|cuisine| cuisine.name}.include?(params[:sort])
      @last = params[:sort]
      @recipes = Recipe.all.select{|recipe| recipe.cuisine.name == params[:sort]}
      erb :welcome
    elsif params[:sort] == "name"
      @last = "Alphabetical"
      @recipes = Recipe.all.sort_by{|recipe| recipe.name}.reverse
      erb :welcome
    end

  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

end
