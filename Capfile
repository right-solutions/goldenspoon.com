# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rbenv'
require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/puma'
# https://stackoverflow.com/questions/43014993/dont-know-how-to-build-task-start-when-run-cap-production-deploy-for-capist
install_plugin Capistrano::Puma

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
