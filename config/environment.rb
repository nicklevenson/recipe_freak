
ENV['SINATRA_ENV'] ||= 'development'
require 'bundler/setup'

Bundler.require

require_all 'app'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "db/#{ENV['SINATRA_ENV']}.pg"
)

configure :development do 
  set :database, 'sqlite3:db/development.pg'
end

use Rack::MethodOverride

require './app/controllers/application_controller'


