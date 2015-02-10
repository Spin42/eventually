class Api::EventBusReportsController < ApiController
  def index
    @event_bus_reports = EventBusReport.all
    puts @event_bus_reports.inspect
  end

end
