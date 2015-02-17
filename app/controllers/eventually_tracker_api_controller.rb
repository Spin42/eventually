require "base64"

class EventuallyTrackerApiController < ApplicationController
  protect_from_forgery with: :null_session
  layout false


  before_action :authenticate


  private
  def authenticate
    api_key     = Base64.decode64 params["api_key"]
    api_secret  = Base64.decode64 params["api_secret"]
    puts api_secret.inspect
    puts api_key.inspect
    application = Application.find_by(api_key: api_key, api_secret: api_secret)
    unless application
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

end
