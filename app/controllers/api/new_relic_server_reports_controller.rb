class Api::NewRelicServerReportsController < ApiController
  def index
    @new_relic_server_reports = NewRelicServerReport.select("DISTINCT ON (new_relic_id) *").order("new_relic_id, created_at DESC")
  end

  def create
    NewRelicServerReport.compute_for_all_servers!
    render nothing: true, status: :created
  end

end
