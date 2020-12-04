require './config/environment'

use Rack::MethodOverride
run ApplicationController
use SessionControllersController
use RecipesController
use UsersController
