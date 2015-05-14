class GoogleAnalyticsProjector < EventuallyToolkit::Projector

  def register_handlers
    on "google analytics visits by channels for day" do | event |
      google_analytics_report = GoogleAnalyticsDailyReport.find_or_initialize_by(
        google_analytics_view_id: event.data["query"]["ids"],
        date_time: event.data["query"]["start-date"].to_datetime.utc)
      google_analytics_report.update_visits_by_channels(event.data)
      google_analytics_report.save!
    end

    on "google analytics users by types for day" do | event |
      google_analytics_report = GoogleAnalyticsDailyReport.find_or_initialize_by(
        google_analytics_view_id: event.data["query"]["ids"],
        date_time: event.data["query"]["start-date"].to_datetime.utc)
      google_analytics_report.update_users_by_types(event.data)
      google_analytics_report.save!
    end

    on "google analytics site speeds for day" do | event |
      google_analytics_report = GoogleAnalyticsDailyReport.find_or_initialize_by(
        google_analytics_view_id: event.data["query"]["ids"],
        date_time: event.data["query"]["start-date"].to_datetime.utc)
      google_analytics_report.update_site_speeds(event.data)
      google_analytics_report.save!
    end
  end
end
