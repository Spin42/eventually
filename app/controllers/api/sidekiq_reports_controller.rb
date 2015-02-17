class Api::SidekiqReportsController < ApiController

  def index
    @sidekiq_reports = SidekiqReport.all
  end

end
