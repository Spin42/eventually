EventuallyToolkit.configure do | config |
  config.redis_url    = Rails.application.config.redis_url
  config.projectors   = [ :twitter, :google_analytics, :new_relic_application,
                          :new_relic_server, :event_store, :event_bus, :sidekiq ]
  config.data_workers = [ :google_analytics , :new_relic_application, :new_relic_server,
                          :twitter, :event_bus, :event_store, :sidekiq ]
end



