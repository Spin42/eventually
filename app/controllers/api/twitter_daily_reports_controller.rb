class Api::TwitterDailyReportsController < ApiController

  def index
    @twitter_daily_reports = TwitterDailyReport.all
  end

end
