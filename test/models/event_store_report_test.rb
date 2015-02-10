# == Schema Information
#
# Table name: event_store_reports
#
#  id                              :integer          not null, primary key
#  events_inserted                 :decimal(64, )
#  events_updated                  :decimal(64, )
#  events_deleted                  :decimal(64, )
#  events_fetched_sequential_scans :decimal(64, )
#  events_fetched_index_scans      :decimal(64, )
#  live_events                     :decimal(64, )
#  live_reports                    :decimal(64, )
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

require 'test_helper'

class EventStoreReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
