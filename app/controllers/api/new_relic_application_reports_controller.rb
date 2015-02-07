class Api::NewRelicApplicationReportsController < ApiController
  def index
    @new_relic_application_reports = NewRelicApplicationReport.select("DISTINCT ON (new_relic_id) *").order("new_relic_id, created_at DESC")
  end

  def create
    NewRelicApplicationDataWorker.perform_async
    render nothing: true, status: :created
  end

end
