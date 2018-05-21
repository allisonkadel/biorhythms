require_relative './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run 'rake db:migrate' to complete migrations.'
end

use Rack::MethodOverride
run ApplicationController
