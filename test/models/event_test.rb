# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  source_name :string
#  name        :text
#  data        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
