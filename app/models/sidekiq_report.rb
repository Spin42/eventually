# == Schema Information
#
# Table name: sidekiq_reports
#
#  id                    :integer          not null, primary key
#  processed             :integer
#  failed                :integer
#  scheduled_size        :integer
#  retry_size            :integer
#  dead_size             :integer
#  processes_size        :integer
#  default_queue_latency :integer
#  workers_size          :integer
#  enqueued              :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class SidekiqReport < ActiveRecord::Base

  def update_statistics(stats)
    self.processed              = stats["processed"]
    self.failed                 = stats["failed"]
    self.scheduled_size         = stats["scheduled_size"]
    self.retry_size             = stats["retry_size"]
    self.dead_size              = stats["dead_size"]
    self.processes_size         = stats["processes_size"]
    self.default_queue_latency  = stats["default_queue_latency"]
    self.workers_size           = stats["workers_size"]
    self.enqueued               = stats["enqueued"]
  end

end
