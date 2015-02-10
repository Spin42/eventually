# == Schema Information
#
# Table name: twitter_daily_reports
#
#  id          :integer          not null, primary key
#  twitter_id  :string
#  screen_name :string
#  name        :string
#  followers   :integer          default("0")
#  friends     :integer          default("0")
#  statuses    :integer          default("0")
#  favourites  :integer          default("0")
#  values      :integer          default("0")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TwitterDailyReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
