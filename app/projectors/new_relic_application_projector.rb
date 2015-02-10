class NewRelicApplicationProjector < Projector

  def register_handlers
    on "new relic applications data" do | event |
      event.data.each do | application_data |
        new_relic_application_report = NewRelicApplicationReport.find_or_initialize_by(new_relic_id: application_data["id"])
        new_relic_application_report.update_application_data(application_data)
        new_relic_application_report.save!
      end
    end
  end
end
