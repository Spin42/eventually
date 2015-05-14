require "uri"
require "rest-client"

class NewRelicService

  def initialize(api_key)
    @api_key = api_key
  end

  def self.client
    @new_relic_service ||= NewRelicService.new(Rails.application.config.new_relic[:api_key])
  end

  def servers
    execute(:get, "servers")["servers"]
  end

  def applications
    execute(:get, "applications")["applications"]
  end

  def execute(method, path)
    uri       = URI.join("https://api.newrelic.com/v2/", "#{path}.json").to_s
    response  = RestClient::Request.execute(
      method: method,
      url:    uri,
      headers: {
        "X-Api-Key" => @api_key
      }
    )
    JSON.parse(response)
  end
end
