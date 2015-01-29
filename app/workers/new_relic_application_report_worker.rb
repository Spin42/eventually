class NewRelicServerReportWorker
  include Sidekiq::Worker

  def perform
    NewRelicApplicationReport.compute_for_all_applications!
  end
end
