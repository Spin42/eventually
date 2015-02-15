class NewRelicApplicationDataWorker < DataWorker

  def fetch_data
    new_relic_applications_data = NewRelicService.client.applications
    event_hash                  = {
      "source_name" => "eventually",
      "name"        => "new relic applications data",
      "data"        => new_relic_applications_data,
      "created_at"  => Time.now.utc
    }
    [event_hash]
  end
end
