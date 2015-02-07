every 5.minutes do
  command "spin42-reporting_rails runner TwitterDataWorker.perform_async"
  command "spin42-reporting_rails runner NewRelicApplicationDataWorker.perform_async"
  command "spin42-reporting_rails runner NewRelicServerDataWorker.perform_async"
  command "spin42-reporting_rails runner GoogleAnalyticsDataWorker.perform_async"
end
