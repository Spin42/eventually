namespace :test do
  task :plop => :environment do
    SidekiqDataWorker.perform_async
  end
end

