require "google/api_client"

class GoogleAnalyticsService

  def initialize
    @google_api_client               = Google::APIClient.new(
                                        application_name:    "Spin42-Reporting",
                                        application_version: "1.0.0")
    key_file                         = File.join(Rails.root, "config", "credentials", "google_apis", "BiPl-47690648982c.p12")
    key                              = Google::APIClient::KeyUtils.load_from_pkcs12(key_file, "notasecret")
    @google_api_client.authorization = Signet::OAuth2::Client.new(
      token_credential_uri: "https://accounts.google.com/o/oauth2/token",
      audience:             "https://accounts.google.com/o/oauth2/token",
      scope:                "https://www.googleapis.com/auth/analytics.readonly",
      issuer:               "498811986685-0h4b0f30lbdv01vjf3nmvvhiqjnj57m0@developer.gserviceaccount.com",
      signing_key:          key)

    @google_api_client.authorization.fetch_access_token!
  end

  def self.client
    @google_analytics_service ||= GoogleAnalyticsService.new
  end

  def page_visits(google_analytics_id, start_date_time, end_date_time, dimensions, metrics)
    analytics = @google_api_client.discovered_api("analytics", "v3")
    sessions  = @google_api_client.execute(
      api_method: analytics.data.ga.get,
      parameters: {
        "ids"        => google_analytics_id,
        "start-date" => start_date_time.strftime("%F"),
        "end-date"   => end_date_time.strftime("%F"),
        "dimensions" => "#{dimensions}",
        "metrics"    => "#{metrics}"
      })
    sessions.data
  end

end
