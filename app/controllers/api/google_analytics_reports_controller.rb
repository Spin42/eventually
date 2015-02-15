class Api::GoogleAnalyticsDailyReportsController < ApiController
  def index
    @google_analytics_daily_reports = GoogleAnalyticsDailyReport.all
  end

end
