class SessionControllersController < ApplicationController

  # GET: /session_controllers
  get "/session_controllers" do
    erb :"/session_controllers/index.html"
  end

  # GET: /session_controllers/new
  get "/session_controllers/new" do
    erb :"/session_controllers/new.html"
  end

  # POST: /session_controllers
  post "/session_controllers" do
    redirect "/session_controllers"
  end

  # GET: /session_controllers/5
  get "/session_controllers/:id" do
    erb :"/session_controllers/show.html"
  end

  # GET: /session_controllers/5/edit
  get "/session_controllers/:id/edit" do
    erb :"/session_controllers/edit.html"
  end

  # PATCH: /session_controllers/5
  patch "/session_controllers/:id" do
    redirect "/session_controllers/:id"
  end

  # DELETE: /session_controllers/5/delete
  delete "/session_controllers/:id/delete" do
    redirect "/session_controllers"
  end
end
