class EventFactory

  def self.create_from_api(params)
    event                 = Event.new
    event.application_uid = params[:event][:application_uid]
    event.type            = "#{params[:event][:type]}_event".camelize
    event.model_name      = params[:event][:model_name]
    event.controller_name = params[:event][:controller_name]
    event.action_name     = params[:event][:action_name]
    event.action_uid      = params[:event][:action_uid] unless params[:event][:action_uid].blank?
    event.date_time       = params[:event][:date_time]
    event.data            = params[:event][:data].to_json unless params[:event][:data].blank?
    event.session_data    = params[:event][:session_data].to_json unless params[:event][:session_data].blank?
    event
  end
end
