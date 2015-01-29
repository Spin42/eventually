@new_relic_application_reports.inject([]) do |new_relic_application_reports, new_relic_application_report|
  new_relic_application_reports.push render(new_relic_application_report)
  new_relic_application_reports
end.to_json
