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

class EventStoreReport < ActiveRecord::Base

  def update_statistics(statistics)
    self.events_inserted                  = statistics["events inserted"]
    self.events_updated                   = statistics["events updated"]
    self.events_deleted                   = statistics["events deleted"]
    self.events_fetched_sequential_scans  = statistics["events fetched by sequential scans"]
    self.events_fetched_index_scans       = statistics["events fetched by index scans"]
    self.live_events                      = statistics["live events"]
    self.live_reports                     = statistics["live reports"]
  end
end
