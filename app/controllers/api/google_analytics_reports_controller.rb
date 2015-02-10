class Api::GoogleAnalyticsReportsController < ApiController
  def index
    @google_analytics_reports = GoogleAnalyticsReport.all
  end

end
