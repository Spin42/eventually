namespace :data_workers do
  task :google_analytics => :environment do
    GoogleAnalyticsDataWorker.perform_async
  end

  task :new_relic_application => :environment do
    NewRelicApplicationDataWorker.perform_async
  end

  task :new_relic_server => :environment do
    NewRelicServerDataWorker.perform_async
  end

  task :twitter => :environment do
    TwitterDataWorker.perform_async
  end
end
