require "twitter"
require "uri"

class TwitterService

  def initialize
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key         = "lrwHCVr0xKRDyjue5V8ser9Jx"
      config.consumer_secret      = "1ht1pZnSjjGsYaCgL1jaAMo5eZIDoWspV1U4ylXoXBpY1PjzAe"
      config.access_token         = "538106823-sUQsM3N6glievye0OP8ZAHSLD6rVbAGaM5seg0sU"
      config.access_token_secret  = "BkL9Is6rjcUSWXB2WGOgfBaM2ecLI7WXevATQgnljxgQo"
    end
  end

  def self.client
    @twitter_service ||= TwitterService.new
  end

  def user(user_id_or_screen_name)
    @twitter.user(user_id_or_screen_name)
  end
end
