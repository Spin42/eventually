class PrivateController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @events = Event.order(created_at: :desc).limit(20)
    @new_relic_server_report_count      = NewRelicServerReport.count
    @new_relic_application_report_count = NewRelicApplicationReport.count
    @twitter_report_count               = TwitterReport.count
  end
end
