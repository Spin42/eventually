class NewRelicServerProjector < EventuallyToolkit::Projector

  def register_handlers
    on "new relic servers data" do | event |
      event.data.each do | server_data |
        new_relic_server_report = NewRelicServerReport.find_or_initialize_by(new_relic_id: server_data["id"])
        new_relic_server_report.update_server_data(server_data)
        new_relic_server_report.save!
      end
    end
  end
end
