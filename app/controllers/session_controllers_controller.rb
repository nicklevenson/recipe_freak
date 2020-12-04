class SessionControllersController < ApplicationController

  get '/login' do
    erb :'sessions/new.html'
  end

  post '/login' do

  end

  delete '/logout' do 
    
  end

end
