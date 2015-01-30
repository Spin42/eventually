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

  def self.compute_for_all_servers!
    new_relic_servers_data = NewRelicService.client.servers
    new_relic_servers_data.each do |server_data|
      self.compute_for_server!(server_data)
    end
  end

  def self.compute_for_server!(server_data)
    attributes                                = { new_relic_id: server_data["id"],
                                                  last_reported_at: server_data["last_reported_at"] }
    new_relic_server_report                   = NewRelicServerReport.find_or_initialize_by attributes
    new_relic_server_report.name              = server_data["name"]
    new_relic_server_report.health_status     = server_data["health_status"]
    new_relic_server_report.reporting         = server_data["reporting"]
    new_relic_server_report.cpu               = BigDecimal.new(server_data["summary"]["cpu"], 4)
    new_relic_server_report.cpu_stolen        = BigDecimal.new(server_data["summary"]["cpu_stolen"], 4)
    new_relic_server_report.disk_io           = BigDecimal.new(server_data["summary"]["disk_io"], 4)
    new_relic_server_report.memory            = BigDecimal.new(server_data["summary"]["memory"], 4)
    new_relic_server_report.memory_used       = BigDecimal.new(server_data["summary"]["memory_used"])
    new_relic_server_report.memory_total      = BigDecimal.new(server_data["summary"]["memory_total"])
    new_relic_server_report.fullest_disk      = BigDecimal.new(server_data["summary"]["fullest_disk"], 4)
    new_relic_server_report.fullest_disk_free = BigDecimal.new(server_data["summary"]["fullest_disk_free"])

    new_relic_server_report.save!
  end

  def healthy
    self.health_status == "green" && self.reporting
  end
end
