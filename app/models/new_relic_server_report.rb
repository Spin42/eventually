# == Schema Information
#
# Table name: new_relic_server_reports
#
#  id                :integer          not null, primary key
#  name              :string
#  new_relic_id      :string
#  health_status     :string
#  reporting         :string
#  last_reported_at  :datetime
#  cpu               :decimal(4, 2)
#  cpu_stolen        :decimal(4, 2)
#  disk_io           :decimal(4, 2)
#  memory            :decimal(4, 2)
#  memory_used       :decimal(20, )
#  memory_total      :decimal(20, )
#  fullest_disk      :decimal(4, 2)
#  fullest_disk_free :decimal(20, )
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class NewRelicServerReport < ActiveRecord::Base

  def update_server_data(server_data)
    self.last_reported_at  = server_data["last_reported_at"]
    self.name              = server_data["name"]
    self.health_status     = server_data["health_status"]
    self.reporting         = server_data["reporting"]
    self.cpu               = BigDecimal.new(server_data["summary"]["cpu"], 4)
    self.cpu_stolen        = BigDecimal.new(server_data["summary"]["cpu_stolen"], 4)
    self.disk_io           = BigDecimal.new(server_data["summary"]["disk_io"], 4)
    self.memory            = BigDecimal.new(server_data["summary"]["memory"], 4)
    self.memory_used       = BigDecimal.new(server_data["summary"]["memory_used"])
    self.memory_total      = BigDecimal.new(server_data["summary"]["memory_total"])
    self.fullest_disk      = BigDecimal.new(server_data["summary"]["fullest_disk"], 4)
    self.fullest_disk_free = BigDecimal.new(server_data["summary"]["fullest_disk_free"])
  end

  def healthy
    self.health_status == "green" && self.reporting
  end
end
