# config valid only for Capistrano 3.1
lock "3.1.0"

set :application,       "spin42-reporting"
set :repo_url,          "git@bitbucket.org:spin42/spin42-reporting.git"
set :branch,            ENV["branch"] || "master"
set :deploy_to,         "/home/spin42-reporting"
set :rvm_type, :user
set :rvm_ruby_version,  "ruby-2.1.5@spin42-reporting"
set :linked_files,      %w{config/database.yml}
set :linked_dirs,       %w{bin log tmp/pids}
set :keep_releases, 5

namespace :deploy do

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "kill -s TERM `cat #{shared_path}/tmp/pids/unicorn.pid`"
      execute "cd #{release_path} && ~/.rvm/bin/rvm #{fetch(:rvm_ruby_version)} do bundle exec unicorn -c #{current_path}/config/unicorn/#{fetch(:stage)}.rb -E #{fetch(:stage)} -D"
    end
  end

  task :start do
    on roles(:app) do
      execute "cd #{release_path} && ~/.rvm/bin/rvm #{fetch(:rvm_ruby_version)} do bundle exec unicorn -c #{current_path}/config/unicorn/#{fetch(:stage)}.rb -E #{fetch(:stage)} -D"
    end
  end

  task :stop do
    on roles(:app) do
      execute "kill -s TERM `cat #{shared_path}/tmp/pids/unicorn.pid`"
    end
  end

  after :publishing, :restart

end
