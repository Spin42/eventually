class Api::ApplicationsController < ApiController

  def show
    @application = Application.ind(params[:id])
  end

  def index
    @applications = Application.all
  end

  def update
    @application = Application.find(params[:id])
    @application = Application.update_attributes(application_params)
    @application.save!
  end

  def create
    @application = Application.new(application_params)
    @application.save!
  end

  private
  def application_params
    params.require("application").permit("name", "api_key", "api_secret")
  end
end
