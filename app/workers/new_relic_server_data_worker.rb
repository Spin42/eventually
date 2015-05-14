class NewRelicServerDataWorker < EventuallyToolkit::DataWorker

  def fetch_data
    new_relic_servers_data  = NewRelicService.client.servers
    event_hash              = {
      "source_name" => "eventually",
      "name"        => "new relic servers data",
      "data"        => new_relic_servers_data,
      "created_at"  => Time.now.utc
    }
    [event_hash]
  end
end
