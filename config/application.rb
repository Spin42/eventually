require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Eventually
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib)

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.redis_url        = ENV["redis_url"]

    config.google_analytics = {
      application_name:     ENV["google_analytics_application_name"],
      application_version:  ENV["google_analytics_application_version"],
      key_file_path:        ENV["google_analytics_key_file_path"],
      issuer:               ENV["google_analytics_issuer"]
    }

    config.new_relic = {
      api_key:              ENV["new_relic_api_key"]
    }

    config.twitter = {
      consumer_key:        ENV["twitter_consumer_key"],
      consumer_secret:     ENV["twitter_consumer_secret"],
      access_token:        ENV["twitter_access_token"],
      access_token_secret: ENV["twitter_access_token_secret"]
    }
  end
end
