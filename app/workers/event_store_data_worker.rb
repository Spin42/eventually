class EventStoreDataWorker < DataWorker

  def fetch_data
    event_hashes      = []
    connection        = ActiveRecord::Base.connection
    event_table_name  = Event.table_name
    result            = connection.execute("SELECT * FROM pg_stat_all_tables WHERE relname='#{event_table_name}'")
    table_statistics  = result[0]
    result            = connection.execute("SELECT SUM(n_live_tup) FROM pg_stat_all_tables WHERE relname LIKE '%_reports'")
    reports           = result[0]["sum"]
    event_hash        = {
      "source_name" => "spin42-reporting",
      "name"        => "event store statistics",
      "data"        => {
        "events inserted"                     => table_statistics["n_tup_ins"],
        "events updated"                      => table_statistics["n_tup_upd"],
        "events deleted"                      => table_statistics["n_tup_del"],
        "events fetched by sequential scans"  => table_statistics["seq_tup_read"],
        "events fetched by index scans"       => table_statistics["idx_tup_fetch"],
        "live events"                         => table_statistics["n_live_tup"],
        "live reports"                        => reports
      },
      "created_at"  => Time.now.utc
    }
    event_hashes.push(event_hash)
    event_hashes
  end

end

