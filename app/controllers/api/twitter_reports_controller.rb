class Api::TwitterReportsController < ApiController
  def index
    @twitter_reports = TwitterReport.select("DISTINCT ON (twitter_id) *").order("twitter_id, created_at DESC")
  end

  def create
    TwitterReport.compute_for_all_users!
    render nothing: true, status: :created
  end

end
