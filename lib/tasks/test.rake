namespace :test do
  task :plop => :environment do
    EventBusDataWorker.perform_async
  end
end

