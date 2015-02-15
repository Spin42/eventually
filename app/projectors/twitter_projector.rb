class TwitterProjector < Projector

  def register_handlers
    on "twitter user data" do | event |
      compute_report!(event)
      compute_daily_report!(event)
    end
  end

  def compute_report!(event)
    user_data       = event.data
    twitter_report  = TwitterReport.find_or_initialize_by(twitter_id: user_data["id"])
    twitter_report.update_user_data(user_data)
    twitter_report.save!
  end

  def compute_daily_report!(event)
    user_data       = event.data
    twitter_report  = TwitterDailyReport.find_or_initialize_by({
      twitter_id: user_data["id"],
      date_time: event.created_at.beginning_of_day
    })
    twitter_report.update_user_data(user_data)
    twitter_report.save!
  end
end
