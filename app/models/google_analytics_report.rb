# == Schema Information
#
# Table name: google_analytics_reports
#
#  id                           :integer          not null, primary key
#  google_analytics_view_id     :string
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

  def update_visits_by_channels(visits_by_channels)
    self.total_visits           = visits_by_channels["totalsForAllResults"]["ga:visits"].try(:to_i)
    self.direct_visits          = extract_value(visits_by_channels["rows"], "Direct").try(:to_i)
    self.organic_search_visits  = extract_value(visits_by_channels["rows"], "Organic Search").try(:to_i)
    self.referral_visits        = extract_value(visits_by_channels["rows"], "Referral").try(:to_i)
    self.social_visits          = extract_value(visits_by_channels["rows"], "Social").try(:to_i)
  end

  def update_users_by_types(users_by_types)
    self.total_users      = users_by_types["totalsForAllResults"]["ga:users"].try(:to_i)
    self.new_users        = extract_value(users_by_types["rows"], "New Visitor").try(:to_i)
    self.returning_users  = extract_value(users_by_types["rows"], "Returning Visitor").try(:to_i)
  end

  def update_site_speeds(site_speeds)
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
