class EventFactory

  def self.build_from_projector(params)
    build(params)
  end

  def self.build_from_event_bus(params)
    build(params)
  end

  def self.build(params)
    event             = Event.new
    event.source_name = params["source_name"]
    event.name        = params["name"]
    event.data        = params["data"]
    event
  end
end
