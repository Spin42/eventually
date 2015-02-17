@events.inject([]) do |events, event|
  events.push render(event)
  events
end.to_json
