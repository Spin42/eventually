# == Schema Information
#
# Table name: twitter_reports
#
#  id               :integer          not null, primary key
#  twitter_id       :string
#  screen_name      :string
#  name             :string
#  followers_count  :integer
#  friends_count    :integer
#  statuses_count   :integer
#  favourites_count :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class TwitterReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
