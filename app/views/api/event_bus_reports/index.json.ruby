@event_bus_reports.inject([]) do |event_bus_reports, event_bus_report|
  event_bus_reports.push render(event_bus_report)
  event_bus_reports
end.to_json
