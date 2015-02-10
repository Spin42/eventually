@event_store_reports.inject([]) do |event_store_reports, event_store_report|
  event_store_reports.push render(event_store_report)
  event_store_reports
end.to_json
