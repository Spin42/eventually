# == Schema Information
#
# Table name: new_relic_servers
#
#  id                :integer          not null, primary key
#  name              :string
#  health_status     :string
#  reporting         :string
#  last_reported_at  :datetime
#  cpu               :decimal(, )
#  cpu_stolen        :decimal(, )
#  disk_io           :decimal(, )
#  memory            :decimal(, )
#  memory_used       :decimal(, )
#  memory_total      :decimal(, )
#  fullest_disk      :decimal(, )
#  fullest_disk_free :decimal(, )
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class NewRelicServerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
