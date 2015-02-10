class EventStoreProjector < Projector

  def register_handlers
    on "event store statistics" do | event |
      event_store_report = EventStoreReport.first_or_initialize
      event_store_report.update_statistics(event.data)
      event_store_report.save!
    end
  end
end
