class TwitterProjector < Projector

  def register_handlers
    on "twitter user data" do |event|
      user_data       = event.data
      twitter_report  = TwitterReport.find_or_initialize_by(twitter_id: user_data["id"])
      twitter_report.update_user_data(user_data)
      twitter_report.save!
    end

    on "twitter user data" do |event|
      user_data       = event.data
      twitter_report  = TwitterDailyReport.find_or_initialize_by(twitter_id: user_data["id"])
      twitter_report.update_user_data(user_data)
      twitter_report.save!
    end
  end
end
