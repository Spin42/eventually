class GoogleAnalyticsProjector < Projector

  def register_handlers
    on "google analytics visits by channels" do |event|
      google_analytics_report = GoogleAnalyticsReport.find_or_initialize_by(google_analytics_view_id: event.data["query"]["ids"])
      google_analytics_report.update_visits_by_channels(event.data)
      google_analytics_report.save!
    end

    on "google analytics users by types" do |event|
      google_analytics_report = GoogleAnalyticsReport.find_or_initialize_by(google_analytics_view_id: event.data["query"]["ids"])
      google_analytics_report.update_users_by_types(event.data)
      google_analytics_report.save!
    end

    on "google analytics site speeds" do |event|
      google_analytics_report = GoogleAnalyticsReport.find_or_initialize_by(google_analytics_view_id: event.data["query"]["ids"])
      google_analytics_report.update_site_speeds(event.data)
      google_analytics_report.save!
    end
  end
end
