class Api::GoogleAnalyticsReportsController < ApiController
  def index
    @google_analytics_reports = GoogleAnalyticsReport.select("DISTINCT ON (google_analytics_view_id) *")
                                .order("google_analytics_view_id, created_at DESC")
  end

  def create
    GoogleAnalyticsDataWorker.perform_async
    render nothing: true, status: :created
  end

end
