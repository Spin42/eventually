class Api::EventStoreReportsController < ApiController
  def index
    @event_store_reports = EventStoreReport.all
  end

end
