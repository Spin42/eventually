class NewRelicApplicationReportWorker
  include Sidekiq::Worker

  def perform
    Event.fetch_new_relic_event_for_all_applications!
    NewRelicApplicationReport.compute_for_all_applications!
  end
end
