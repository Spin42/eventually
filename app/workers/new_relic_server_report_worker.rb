class NewRelicServerReportWorker
  include Sidekiq::Worker

  def perform
    Event.fetch_new_relic_event_for_all_servers!
    NewRelicServerReport.compute_for_all_servers!
  end
end
