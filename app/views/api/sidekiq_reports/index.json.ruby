@sidekiq_reports.inject([]) do |sidekiq_reports, sidekiq_report|
  sidekiq_reports.push render(sidekiq_report)
  sidekiq_reports
end.to_json
