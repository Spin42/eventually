class Api::EventBusReportsController < ApiController

  def index
    @event_bus_reports = EventBusReport.all
  end

end
