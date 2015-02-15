namespace :test do
  task :plop => :environment do
    GoogleAnalyticsDataWorker.perform_async
  end
end

