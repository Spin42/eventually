require "twitter"
require "uri"

class TwitterService

  def initialize
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key         = Rails.application.config.twitter[:consumer_key]
      config.consumer_secret      = Rails.application.config.twitter[:consumer_secret]
      config.access_token         = Rails.application.config.twitter[:access_token]
      config.access_token_secret  = Rails.application.config.twitter[:access_token_secret]
    end
  end

  def self.client
    @twitter_service ||= TwitterService.new
  end

  def user(user_id_or_screen_name)
    @twitter.user(user_id_or_screen_name)
  end
end
