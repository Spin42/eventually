class SidekiqDataWorker < EventuallyToolkit::DataWorker

  def fetch_data
    sidekiq_stats = Sidekiq::Stats.new
    event_hash    = {
      "source_name" => "eventually",
      "name"        => "sidekiq stats",
      "data"        => {
        "processed"             => sidekiq_stats.processed,
        "failed"                => sidekiq_stats.failed,
        "scheduled_size"        => sidekiq_stats.scheduled_size,
        "retry_size"            => sidekiq_stats.retry_size,
        "dead_size"             => sidekiq_stats.dead_size,
        "processes_size"        => sidekiq_stats.processes_size,
        "default_queue_latency" => sidekiq_stats.default_queue_latency,
        "workers_size"          => sidekiq_stats.workers_size,
        "enqueued"              => sidekiq_stats.enqueued
      },
      "created_at"  => Time.now.utc
    }
    [event_hash]
  end
end
