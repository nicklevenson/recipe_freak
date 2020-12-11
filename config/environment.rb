
ENV['SINATRA_ENV'] ||= 'development'
require 'bundler/setup'

Bundler.require

require_all 'app'

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

# configure :development do 
#   set :database, 'sqlite3:db/development.sqlite'
# end

configure :development do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'recipe_freak_db', pool: 2, username: 'nicklevenson', password: 'Circle26'}
end

configure :production do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'recipe_freak_db', pool: 2, username: 'nicklevenson', password: 'Circle26'}
end

use Rack::MethodOverride

require './app/controllers/application_controller'


