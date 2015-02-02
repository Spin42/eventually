class Api::TwitterReportsController < ApiController
  def index
    @twitter_reports = TwitterReport.select("DISTINCT ON (twitter_id) *").order("twitter_id, created_at DESC")
  end

  def create
    TwitterReportWorker.perform_async
    render nothing: true, status: :created
  end

end
