# == Schema Information
#
# Table name: event_bus_reports
#
#  id         :integer          not null, primary key
#  queue      :string
#  size       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EventBusReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
