# config valid only for Capistrano 3.1
lock "3.1.0"

set :application,         "spin42-reporting"
set :repo_url,            "git@bitbucket.org:spin42/spin42-reporting.git"
set :branch,              ENV["branch"] || "master"
set :deploy_to,           "/home/spin42-reporting"
set :rvm_type,            :user
set :rvm_ruby_version,    "ruby-2.2.0@spin42-reporting"
set :linked_files,        %w{ config/database.yml config/secrets.yml }
set :linked_dirs,         %w{ bin log tmp/pids config/credentials }
set :keep_releases,       5
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_environment,-> { fetch(:stage) }
set :projectors,          %w{ twitter google_analytics new_relic_application new_relic_server event_bus event_store }

namespace :deploy do

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "kill -s TERM `cat #{shared_path}/tmp/pids/unicorn.pid`"
      execute "cd #{release_path} && ~/.rvm/bin/rvm #{fetch(:rvm_ruby_version)} do bundle exec unicorn -c #{current_path}/config/unicorn/#{fetch(:stage)}.rb -E #{fetch(:stage)} -D"
    end
  end

  task :restart_projectors do
    on roles(:app), in: :sequence, wait: 5 do
      fetch(:projectors).each do | projector |
        execute "supervisorctl restart spin42-reporting-#{projector}_projector"
      end
    end
  end

  task :start do
    on roles(:app) do
      execute "cd #{release_path} && ~/.rvm/bin/rvm #{fetch(:rvm_ruby_version)} do bundle exec unicorn -c #{current_path}/config/unicorn/#{fetch(:stage)}.rb -E #{fetch(:stage)} -D"
    end
  end

  task :start_projectors do
    on roles(:app) do
      fetch(:projectors).each do | projector |
        execute "supervisorctl start spin42-reporting-#{projector}_projector"
      end
    end
  end

  task :stop do
    on roles(:app) do
      execute "kill -s TERM `cat #{shared_path}/tmp/pids/unicorn.pid`"
    end
  end

  task :stop_projectors do
    on roles(:app) do
      fetch(:projectors).each do | projector |
        execute "supervisorctl stop spin42-reporting-#{projector}_projector"
      end
    end
  end

  task :update_supervisor_config do
    on roles(:app) do
      execute "supervisorctl reread"
      execute "supervisorctl update"
    end
  end

  before  "deploy:restart", "deploy:update_supervisor_config"
  after   "publishing",     "restart"
  after   "restart",        "restart_projectors"
end
