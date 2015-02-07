class NewRelicServerDataWorker < DataWorker

  def fetch_data
    new_relic_servers_data  = NewRelicService.client.servers
    event_hash              = {
      "source_name" => "spin42-reporting",
      "name"        => "new relic servers data",
      "data"        => new_relic_servers_data
    }
    [event_hash]
  end
end
