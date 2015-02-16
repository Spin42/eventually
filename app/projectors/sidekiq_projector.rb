class SidekiqProjector < Projector

  def register_handlers
    on "sidekiq stats" do | event |
      sidekiq_report = SidekiqReport.first_or_initialize
      sidekiq_report.update_statistics(event.data)
      sidekiq_report.save!
    end
  end
end
