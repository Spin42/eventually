class EventuallyTrackerApi::EventsController < EventuallyTrackerApiController

  def create
    action_source = params["event"]["controller_name"] || params["event"]["model_name"]
    event_hash    = {
      "source_name" => params["event"]["application_name"],
      "name"        => "#{action_source} #{params['event']['action_name']}",
      "data"        => params["event"],
      "created_at"  => params["event"]["date_time"]
    }
    event_handler = EventHandler.new
    event_handler.handle([event_hash])
    render nothing: true, status: :ok
  end

end
