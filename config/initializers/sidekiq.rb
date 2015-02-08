Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.config.redis_url }
end
