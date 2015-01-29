# == Schema Information
#
# Table name: new_relic_application_reports
#
#  id                        :integer          not null, primary key
#  name                      :string
#  new_relic_id              :string
#  health_status             :string
#  reporting                 :string
#  last_reported_at          :datetime
#  response_time             :decimal(4, 2)
#  throughput                :decimal(4, 2)
#  error_rate                :decimal(4, 2)
#  apdex_target              :decimal(4, 2)
#  apdex_score               :decimal(4, 2)
#  host_count                :integer
#  instance_count            :integer
#  concurrent_instance_count :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require 'test_helper'

class NewRelicApplicationReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
