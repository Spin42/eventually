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

class Event < ActiveRecord::Base

end
