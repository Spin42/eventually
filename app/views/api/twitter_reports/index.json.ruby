@twitter_reports.inject([]) do |twitter_reports, twitter_report|
  twitter_reports.push render(twitter_report)
  twitter_reports
end.to_json
