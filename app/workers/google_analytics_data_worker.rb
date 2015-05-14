class GoogleAnalyticsDataWorker < EventuallyToolkit::DataWorker
  include Sidekiq::Worker

  GOOGLE_ANALYTICS_VIEW_IDS = [ "ga:81963782", "ga:90616019" ]

  def fetch_data
    event_hashes    = []
    start_date_time = DateTime.now.utc.beginning_of_day
    end_date_time   = DateTime.now.utc.end_of_day
    GOOGLE_ANALYTICS_VIEW_IDS.each do |google_analytics_view_id|
      event_hashes.push(fetch_visits_by_channel_data(google_analytics_view_id, start_date_time, end_date_time))
      event_hashes.push(fetch_users_by_types_data(google_analytics_view_id, start_date_time, end_date_time))
      event_hashes.push(fetch_site_speeds_data(google_analytics_view_id, start_date_time, end_date_time))
    end
    event_hashes
  end

  def fetch_visits_by_channel_data(google_analytics_view_id, start_date_time, end_date_time)
    visits_by_channels  = GoogleAnalyticsService.client.page_visits(
                            google_analytics_view_id,
                            start_date_time, end_date_time,
                            "ga:channelGrouping", "ga:visits")
    {
      "source_name" => "eventually",
      "name"        => "google analytics visits by channels for day",
      "data"        => visits_by_channels.to_json,
      "created_at"  => Time.now.utc
    }
  end

  def fetch_users_by_types_data(google_analytics_view_id, start_date_time, end_date_time)
    users_by_types  = GoogleAnalyticsService.client.page_visits(
                        google_analytics_view_id,
                        start_date_time, end_date_time,
                        "ga:userType", "ga:users")
    {
      "source_name" => "eventually",
      "name"        => "google analytics users by types for day",
      "data"        => users_by_types.to_json,
      "created_at"  => Time.now.utc
    }
  end

  def fetch_site_speeds_data(google_analytics_view_id, start_date_time, end_date_time)
    site_speeds = GoogleAnalyticsService.client.page_visits(
                    google_analytics_view_id,
                    start_date_time, end_date_time,
                    "", "ga:avgServerResponseTime, ga:avgPageDownloadTime, ga:avgPageLoadTime")
    {
      "source_name" => "eventually",
      "name"        => "google analytics site speeds for day",
      "data"        => site_speeds.to_json,
      "created_at"  => Time.now.utc
    }
  end
end
