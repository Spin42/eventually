class GoogleAnalyticsReportWorker
  include Sidekiq::Worker

  def perform
    Event.fetch_google_analytics_event_for_all_views!
    GoogleAnalyticsReport.compute_for_all_views!
  end
end
