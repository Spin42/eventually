class Api::NewRelicServerReportsController < ApiController
  def index
    @new_relic_server_reports = NewRelicServerReport.all
  end

end
