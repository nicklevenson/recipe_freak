
ENV['SINATRA_ENV'] ||= 'development'
require 'bundler/setup'

Bundler.require

require_all 'app'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

configure :development do 
  set :database, 'sqlite3:db/development.sqlite'
end

use Rack::MethodOverride

require './app/controllers/application_controller'


