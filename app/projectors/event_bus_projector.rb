class EventBusProjector < Projector

  def register_handlers
    on "event bus statistics" do | event |
      event_bus_report = EventBusReport.find_or_initialize_by(queue: event.data["queue"])
      event_bus_report.update_statistics(event.data)
      event_bus_report.save!
    end
  end
end
