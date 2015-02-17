class Api::GoogleAnalyticsDailyReportsController < ApiController

  def index
    if params[:google_analytics_view_id]
      @google_analytics_daily_reports = GoogleAnalyticsDailyReport.where(google_analytics_view_id: params[:google_analytics_view_id])
    else
      @google_analytics_daily_reports = GoogleAnalyticsDailyReport.all
    end
    @google_analytics_daily_reports = @google_analytics_daily_reports.order(date_time: :desc)
  end

end
