class Api::NewRelicApplicationReportsController < ApiController
  def index
    @new_relic_application_reports = NewRelicApplicationReport.select("DISTINCT(new_relic_id), *").order("created_at DESC")
  end

  def create
    NewRelicApplicationReport.compute_for_all_applications!
    render nothing: true, status: :created
  end

end
