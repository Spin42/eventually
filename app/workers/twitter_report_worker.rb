class TwitterReportWorker
  include Sidekiq::Worker

  def perform
    Event.fetch_twitter_event_for_all_users!
    TwitterReport.compute_for_all_users!
  end
end
