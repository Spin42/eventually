require "uri"

class NewRelicService

  def initialize(api_key)
    @api_key = api_key
  end

  def self.client
    @new_relic_service ||= NewRelicService.new("a27b734ff9d4be65a23624126a729b9c74f7f8aca3fbd00")
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
