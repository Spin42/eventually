@google_analytics_daily_reports.inject([]) do |google_analytics_daily_reports, google_analytics_daily_report|
  google_analytics_daily_reports.push render(google_analytics_daily_report)
  google_analytics_daily_reports
end.to_json
