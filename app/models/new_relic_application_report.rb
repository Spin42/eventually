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

  def update_application_data(application_data)
    self.last_reported_at = application_data["last_reported_at"]
    self.name             = application_data["name"]
    self.health_status    = application_data["health_status"]
    self.reporting        = application_data["reporting"]
    if application_data["application_summary"]
      self.response_time    = BigDecimal.new(application_data["application_summary"]["response_time"], 15)
      self.throughput       = BigDecimal.new(application_data["application_summary"]["throughput"], 4)
      self.error_rate       = BigDecimal.new(application_data["application_summary"]["error_rate"], 4)
      self.apdex_target     = BigDecimal.new(application_data["application_summary"]["apdex_target"], 4)
      self.apdex_score      = BigDecimal.new(application_data["application_summary"]["apdex_score"], 4)
      self.host_count       = application_data["application_summary"]["host_count"]
      self.instance_count   = application_data["application_summary"]["instance_count"]
    end
  end

  def healthy
    self.health_status == "green" && self.reporting
  end

end
