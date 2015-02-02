@google_analytics_reports.inject([]) do |google_analytics_reports, google_analytics_report|
  google_analytics_reports.push render(google_analytics_report)
  google_analytics_reports
end.to_json
