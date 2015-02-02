# == Schema Information
#
# Table name: google_analytics_reports
#
#  id                           :integer          not null, primary key
#  google_analytics_view_id     :string
#  start_date_time              :datetime
#  end_date_time                :datetime
#  total_visits                 :integer
#  direct_visits                :integer
#  organic_search_visits        :integer
#  referral_visits              :integer
#  social_visits                :integer
#  total_users                  :integer
#  new_users                    :integer
#  returning_users              :integer
#  average_server_response_time :decimal(15, 2)
#  average_page_download_time   :decimal(15, 2)
#  average_page_load_time       :decimal(15, 2)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class GoogleAnalyticsReport < ActiveRecord::Base

  def self.compute_for_all_views!
    Event::GOOGLE_ANALYTICS_VIEW_IDS.each do |google_analytics_view_id|
      self.compute_for_view!(google_analytics_view_id)
    end
  end

  def self.compute_for_view!(google_analytics_view_id)
    google_analytics_report                           = GoogleAnalyticsReport.new
    google_analytics_report.google_analytics_view_id  = google_analytics_view_id
    # check dimensions too in requests
    google_analytics_report.compute_visits_by_channels
    google_analytics_report.compute_users_by_types
    google_analytics_report.compute_site_speeds
    google_analytics_report.save!
  end

  def compute_visits_by_channels
    dimensions                  = "ga:channelGrouping"
    metrics                     = "ga:visits"
    event                       = Event.where("name = ?", "google analytics visits by channels")
                                  .where("data->'query'->>'ids' = ?", google_analytics_view_id)
                                  .where("data->'query'->>'dimensions' = ?", dimensions)
                                  .order(created_at: :desc).first
    visits_by_channels          = event.data
    self.total_visits           = visits_by_channels["totalsForAllResults"]["ga:visits"].try(:to_i)
    self.direct_visits          = extract_value(visits_by_channels["rows"], "Direct").try(:to_i)
    self.organic_search_visits  = extract_value(visits_by_channels["rows"], "Organic Search").try(:to_i)
    self.referral_visits        = extract_value(visits_by_channels["rows"], "Referral").try(:to_i)
    self.social_visits          = extract_value(visits_by_channels["rows"], "Social").try(:to_i)
  end

  def compute_users_by_types
    dimensions                  = "ga:userType"
    metrics                     = "ga:users"
    event                       = Event.where("name = ?", "google analytics users by types")
                                    .where("data->'query'->>'ids' = ?", google_analytics_view_id)
                                    .where("data->'query'->>'dimensions' = ?", dimensions)
                                    .order(created_at: :desc).first
    users_by_types      = event.data
    self.total_users    = users_by_types["totalsForAllResults"]["ga:users"].try(:to_i)
    self.new_users      = extract_value(users_by_types["rows"], "New Visitor").try(:to_i)
    self.returning_users= extract_value(users_by_types["rows"], "Returning Visitor").try(:to_i)
  end

  def compute_site_speeds
    dimensions                        = ""
    metrics                           = "ga:avgServerResponseTime, ga:avgPageDownloadTime, ga:avgPageLoadTime"
    event                             = Event.where("name = ?", "google analytics site speeds")
                                          .where("data->'query'->>'ids' = ?", google_analytics_view_id)
                                          .where("data->'query'->>'dimensions' = ?", dimensions)
                                          .order(created_at: :desc).first
    site_speeds                       = event.data
    self.average_server_response_time = site_speeds["totalsForAllResults"]["ga:avgServerResponseTime"]
    self.average_page_download_time   = site_speeds["totalsForAllResults"]["ga:avgPageDownloadTime"]
    self.average_page_load_time       = site_speeds["totalsForAllResults"]["ga:avgPageLoadTime"]
  end

  private
  def extract_value(values, name)
    values.each do | value |
      if value[0] == name
        return value[1]
      end
    end
    nil
  end
end
