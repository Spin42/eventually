# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  source_name :string
#  name        :text
#  data        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base

  TWITTER_USERS             = [ "Spin_42" ]
  GOOGLE_ANALYTICS_VIEW_IDS = [ "ga:81963782", "ga:90616019" ]

  def self.fetch_new_relic_event_for_all_servers!
    new_relic_servers_data  = NewRelicService.client.servers
    event                   = Event.new
    event.source_name       = "spin42-reporting"
    event.name              = "new relic servers"
    event.data              = new_relic_servers_data
    event.save!
  end

  def self.fetch_new_relic_event_for_all_applications!
    new_relic_applications_data   = NewRelicService.client.applications
    event                         = Event.new
    event.source_name             = "spin42-reporting"
    event.name                    = "new relic applications"
    event.data                    = new_relic_applications_data
    event.save!
  end

  def self.fetch_twitter_event_for_all_users!
    TWITTER_USERS.each do |user_id_or_screen_name|
      user_data         = TwitterService.client.user(user_id_or_screen_name)
      event             = Event.new
      event.source_name = "spin42-reporting"
      event.name        = "twitter user"
      event.data        = user_data.attrs
      event.save!
    end
  end

  def self.fetch_google_analytics_event_for_all_views!
    start_date_time = DateTime.now.utc.beginning_of_day
    end_date_time   = DateTime.now.utc.end_of_day
    GOOGLE_ANALYTICS_VIEW_IDS.each do |google_analytics_view_id|
      fetch_google_analytics_event_visits_by_channel!(google_analytics_view_id, start_date_time, end_date_time)
      fetch_google_analytics_event_users_by_types!(google_analytics_view_id, start_date_time, end_date_time)
      fetch_google_analytics_event_site_speeds!(google_analytics_view_id, start_date_time, end_date_time)
    end
  end

  def self.fetch_google_analytics_event_visits_by_channel!(google_analytics_view_id, start_date_time, end_date_time)
    visits_by_channels  = GoogleAnalyticsService.client.page_visits(
                            google_analytics_view_id,
                            start_date_time, end_date_time,
                            "ga:channelGrouping", "ga:visits")
    event               = Event.new
    event.source_name   = "spin42-reporting"
    event.name          = "google analytics visits by channels"
    event.data          = visits_by_channels.to_json
    event.save!
  end

  def self.fetch_google_analytics_event_users_by_types!(google_analytics_view_id, start_date_time, end_date_time)
    users_by_types      = GoogleAnalyticsService.client.page_visits(
                            google_analytics_view_id,
                            start_date_time, end_date_time,
                            "ga:userType", "ga:users")
    event               = Event.new
    event.source_name   = "spin42-reporting"
    event.name          = "google analytics users by types"
    event.data          = users_by_types.to_json
    event.save!
  end

  def self.fetch_google_analytics_event_site_speeds!(google_analytics_view_id, start_date_time, end_date_time)
    site_speeds         = GoogleAnalyticsService.client.page_visits(
                            google_analytics_view_id,
                            start_date_time, end_date_time,
                            "", "ga:avgServerResponseTime, ga:avgPageDownloadTime, ga:avgPageLoadTime")
    event               = Event.new
    event.source_name   = "spin42-reporting"
    event.name          = "google analytics site speeds"
    event.data          = site_speeds.to_json
    event.save!
  end
end
