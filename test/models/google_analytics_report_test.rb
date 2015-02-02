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

require 'test_helper'

class GoogleAnalyticsReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
