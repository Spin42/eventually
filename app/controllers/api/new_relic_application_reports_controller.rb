class Api::NewRelicApplicationReportsController < ApiController
  def index
    @new_relic_application_reports = NewRelicApplicationReport.all
  end

end
