class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  layout false

  before_action :authenticate

  private
  def authenticate
    api_key     = Base64.decode64(params["api_key"]) if params["api_key"]
    api_secret  = Base64.decode64(params["api_secret"]) if params["api_secret"]
    application = Application.find_by(api_key: api_key, api_secret: api_secret)
    unless !Rails.env.production? || application
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end
end
