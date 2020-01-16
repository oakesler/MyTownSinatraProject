require_relative './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise "Migrations are pending.Run 'rake db:migrate' to"
end

use Rack::MethodOverride
use SessionsController
use PostsController
use UsersController
run ApplicationController
