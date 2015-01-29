@new_relic_server_reports.inject([]) do |new_relic_server_reports, new_relic_server_report|
  new_relic_server_reports.push render(new_relic_server_report)
  new_relic_server_reports
end.to_json
