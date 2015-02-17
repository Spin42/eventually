class Api::NewRelicServerReportsController < ApiController

  def index
    if params[:new_relic_id]
      @new_relic_server_reports = NewRelicServerReport.where(new_relic_id: params[:new_relic_id])
    else
      @new_relic_server_reports = NewRelicServerReport.all
    end
  end

end
