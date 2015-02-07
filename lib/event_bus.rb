require "redis"
require "json"

class EventBus

  def initialize
    @redis  = Redis.new
    @queues = {}
    Rails.application.config.projectors.map do | projector_name, projector_attributes |
      @queues[projector_attributes[:class_name]] = projector_attributes[:event_bus_queue]
    end
  end

  def push(data)
    @queues.values.each do | queue |
      @redis.rpush(queue, data.to_json)
    end
  end

  def pop(projector_class_name, block=false)
    queue = @queues[projector_class_name]
    if block
      event_hash = @redis.blpop(queue)[1]
    else
      event_hash = @redis.lpop(queue)[1]
    end
    JSON.parse(event_hash)
  end

end
