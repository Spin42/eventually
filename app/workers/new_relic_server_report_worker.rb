class NewRelicServerReportWorker
  include Sidekiq::Worker

  def perform
    NewRelicServerReport.compute_for_all_servers!
  end
end
