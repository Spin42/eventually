class EventBusDataWorker < DataWorker

  def fetch_data
    event_hashes  = []
    redis         = Redis.new(:url => Rails.application.config.redis_url)

    Rails.application.config.projectors.each do | projector_name, projector_data |
      queue       = projector_data[:event_bus_queue]
      event_hash  = {
        "source_name" => "eventually",
        "name"        => "event bus statistics",
        "data"        => {
          "queue" => queue,
          "size"  => get_redis_key_size(redis, queue)
        },
        "created_at"  => Time.now.utc
      }
      event_hashes.push(event_hash)
    end

    event_hashes
  end

  def get_redis_key_size(redis, key)
    key_type = redis.type(key)
    case key_type
    when "list"
      redis.llen(key)
    when "set"
      redis.scard(key)
    when "hash"
      redis.hlen(key)
    else
      0
    end
  end

end

