every 5.minutes do
  command ":environment_variable=:environment spin42-reporting_rake data_workers:google_analytics"
  command ":environment_variable=:environment spin42-reporting_rake data_workers:new_relic_application"
  command ":environment_variable=:environment spin42-reporting_rake data_workers:new_relic_server"
  command ":environment_variable=:environment spin42-reporting_rake data_workers:twitter"
end
