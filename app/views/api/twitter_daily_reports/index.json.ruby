@twitter_daily_reports.inject([]) do |twitter_daily_reports, twitter_daily_report|
  twitter_daily_reports.push render(twitter_daily_report)
  twitter_daily_reports
end.to_json
