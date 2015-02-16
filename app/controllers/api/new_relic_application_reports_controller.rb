class Api::NewRelicApplicationReportsController < ApiController

  def index
    if params[:new_relic_id]
      @new_relic_application_reports = NewRelicApplicationReport.where(new_relic_id: params[:new_relic_id])
    else
      @new_relic_application_reports = NewRelicApplicationReport.all
    end
  end

end
