# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  application_uid :string
#  type            :string
#  model_name      :string
#  controller_name :string
#  action_name     :string
#  action_uid      :string
#  date_time       :datetime
#  data            :text
#  session_data    :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
