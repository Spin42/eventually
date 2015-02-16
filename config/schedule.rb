case @environment
when "production"
  every 5.minutes do
    command "cd /home/eventually/current && RAILS_ENV=production eventually_rake data_workers:google_analytics"
    command "cd /home/eventually/current && RAILS_ENV=production eventually_rake data_workers:new_relic_application"
    command "cd /home/eventually/current && RAILS_ENV=production eventually_rake data_workers:new_relic_server"
    command "cd /home/eventually/current && RAILS_ENV=production eventually_rake data_workers:twitter"
  end

  every 1.minutes do
    command "cd /home/eventually/current && RAILS_ENV=production eventually_rake data_workers:event_bus"
    command "cd /home/eventually/current && RAILS_ENV=production eventually_rake data_workers:event_store"
    command "cd /home/eventually/current && RAILS_ENV=production eventually_rake data_workers:sidekiq"
  end
end
