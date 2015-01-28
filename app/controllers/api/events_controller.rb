class Api::EventsController < ApiController

  def create
    event = EventFactory.create_from_api params
    event.save!
    render nothing: true, status: :created
  end
end
