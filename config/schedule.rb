every 5.minutes do
  command "spin42-reporting_rake data_workers:google_analytics"
  command "spin42-reporting_rake data_workers:new_relic_application"
  command "spin42-reporting_rake data_workers:new_relic_server"
  command "spin42-reporting_rake data_workers:twitter"
end
