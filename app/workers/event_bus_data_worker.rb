class EventBusDataWorker < EventuallyToolkit::DataWorker

  def fetch_data
    event_hashes  = []
    redis         = Redis.new(:url => Rails.application.config.redis_url)

    EventuallyToolkit.config.projectors.each do | projector_name |
      klass       = "#{projector_name}_projector".camelize.constantize
      queue       = klass.event_bus_queue
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

