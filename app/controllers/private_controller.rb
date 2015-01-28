class PrivateController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @events = Event.order(created_at: :desc).limit(20)
  end
end
