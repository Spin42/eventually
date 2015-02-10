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

class EventBusReport < ActiveRecord::Base

  def update_statistics(statistics)
    self.queue  = statistics["queue"]
    self.size   = statistics["size"]
  end
end
