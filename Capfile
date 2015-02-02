require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/rvm"
require "capistrano/bundler"
require "capistrano/rails/migrations"
require "capistrano/rails/assets"
require "capistrano/sidekiq"
require "whenever/capistrano"

Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
