case @environment
when "production"
  every 5.minutes do
    command "cd /home/spin42-reporting/current && RAILS_ENV=production spin42-reporting_rake data_workers:google_analytics"
    command "cd /home/spin42-reporting/current && RAILS_ENV=production spin42-reporting_rake data_workers:new_relic_application"
    command "cd /home/spin42-reporting/current && RAILS_ENV=production spin42-reporting_rake data_workers:new_relic_server"
    command "cd /home/spin42-reporting/current && RAILS_ENV=production spin42-reporting_rake data_workers:twitter"
  end

  every 1.minutes do
    command "cd /home/spin42-reporting/current && RAILS_ENV=production spin42-reporting_rake data_workers:event_bus"
    command "cd /home/spin42-reporting/current && RAILS_ENV=production spin42-reporting_rake data_workers:event_store"

  end
end
