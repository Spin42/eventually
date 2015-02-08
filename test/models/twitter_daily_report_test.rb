# == Schema Information
#
# Table name: twitter_daily_reports
#
#  id          :integer          not null, primary key
#  twitter_id  :string
#  screen_name :string
#  name        :string
#  followers   :integer
#  friends     :integer
#  statuses    :integer
#  favourites  :integer
#  values      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TwitterDailyReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
