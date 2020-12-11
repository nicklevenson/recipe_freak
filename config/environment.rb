
# ENV['SINATRA_ENV'] ||= 'development'
# require 'bundler/setup'

# Bundler.require

# require_all 'app'

# # ActiveRecord::Base.establish_connection(
# #   :adapter => "sqlite3",
# #   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# # )

# # configure :development do 
# #   set :database, 'sqlite3:db/development.sqlite'
# # end

# configure :development do
#   set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'recipe_freak_db', pool: 2, username: 'nicklevenson', password: 'Circle26'}
# end

# configure :production do
#   set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'recipe_freak_db', pool: 2, username: 'nicklevenson', password: 'Circle26'}
# end

require 'bundler/setup'
Bundler.require
# configure :development do
#  ENV['SINATRA_ENV'] ||= "development"
# require 'bundler/setup'
#  Bundler.require(:default, ENV['SINATRA_ENV'])
# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
#  )
# end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/recipe_freak_db')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end

use Rack::MethodOverride

require './app/controllers/application_controller'


