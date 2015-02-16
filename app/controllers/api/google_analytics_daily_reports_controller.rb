class Api::GoogleAnalyticsDailyReportsController < ApiController
  def index
    if
      @google_analytics_daily_reports = GoogleAnalyticsDailyReport.where(google_analytics_view_id: params[:view_id])
    else
      @google_analytics_daily_reports = GoogleAnalyticsDailyReport.all
    end
    @google_analytics_daily_reports = @google_analytics_daily_reports.order(date_time: :desc)
  end

end
