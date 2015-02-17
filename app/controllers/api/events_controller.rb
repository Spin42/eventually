class Api::EventsController < ApiController

  def index
    @events = Event.order(created_at: :desc).limit(1000)
  end
