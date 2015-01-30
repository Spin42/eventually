# == Schema Information
#
# Table name: new_relic_application_reports
#
#  id               :integer          not null, primary key
#  name             :string
#  new_relic_id     :string
#  health_status    :string
#  reporting        :string
#  last_reported_at :datetime
#  response_time    :decimal(15, 2)
#  throughput       :decimal(4, 2)
#  error_rate       :decimal(4, 2)
#  apdex_target     :decimal(4, 2)
#  apdex_score      :decimal(4, 2)
#  host_count       :integer
#  instance_count   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class NewRelicApplicationReport < ActiveRecord::Base

  def self.compute_for_all_applications!
    new_relic_applications_data = NewRelicService.client.applications
    new_relic_applications_data.each do |application_data|
      self.compute_for_application!(application_data)
    end
  end

  def self.compute_for_application!(application_data)
    attributes                                  = { new_relic_id: application_data["id"],
                                                    last_reported_at: application_data["last_reported_at"] }
    new_relic_application_report                = NewRelicApplicationReport.find_or_initialize_by attributes
    new_relic_application_report.name           = application_data["name"]
    new_relic_application_report.health_status  = application_data["health_status"]
    new_relic_application_report.reporting      = application_data["reporting"]
    new_relic_application_report.response_time  = BigDecimal.new(application_data["application_summary"]["response_time"], 15)
    new_relic_application_report.throughput     = BigDecimal.new(application_data["application_summary"]["throughput"], 4)
    new_relic_application_report.error_rate     = BigDecimal.new(application_data["application_summary"]["error_rate"], 4)
    new_relic_application_report.apdex_target   = BigDecimal.new(application_data["application_summary"]["apdex_target"], 4)
    new_relic_application_report.apdex_score    = BigDecimal.new(application_data["application_summary"]["apdex_score"], 4)
    new_relic_application_report.host_count     = application_data["application_summary"]["host_count"]
    new_relic_application_report.instance_count = application_data["application_summary"]["instance_count"]

    new_relic_application_report.save!
  end

  def healthy
    self.health_status == "green" && self.reporting
  end

end
