case @environment
when "production"
  every 5.minutes do
    command "RAILS_ENV=production spin42-reporting_rake data_workers:google_analytics"
    command "RAILS_ENV=production spin42-reporting_rake data_workers:new_relic_application"
    command "RAILS_ENV=production spin42-reporting_rake data_workers:new_relic_server"
    command "RAILS_ENV=production spin42-reporting_rake data_workers:twitter"
  end
end
