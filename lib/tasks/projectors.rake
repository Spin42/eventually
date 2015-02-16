namespace :projectors do
  task :start => :environment do
    pids = []
    Rails.application.config.projectors.each do | projector_name, projector_attributes |
      class_name = projector_attributes[:class_name]
      pid = fork do
        class_name.camelize.constantize.new.start
      end
      pids.push(pid)
    end
    Signal.trap("SIGINT") do
      puts "Terminating..."
      pids.each do |pid|
        puts "Sending sig term to #{pid}."
        Process.kill("TERM", pid)
      end
    end
    Process.wait
  end

  task :twitter => :environment do
    TwitterProjector.new.start
  end

  task :google_analytics => :environment do
    GoogleAnalyticsProjector.new.start
  end

  task :new_relic_application => :environment do
    NewRelicApplicationProjector.new.start
  end

  task :new_relic_server => :environment do
    NewRelicServerProjector.new.start
  end

  task :event_bus => :environment do
    EventBusProjector.new.start
  end

  task :event_store => :environment do
    EventStoreProjector.new.start
  end

  task :sidekiq => :environment do
    SidekiqProjector.new.start
  end
end

