class Api::TwitterReportsController < ApiController
  def index
    @twitter_reports = TwitterReport.all
  end

  def create
    TwitterReport.compute_for_all_users!
    render nothing: true, status: :created
  end

end
