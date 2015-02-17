class Api::TwitterReportsController < ApiController

  def index
    @twitter_reports = TwitterReport.all
  end

end
