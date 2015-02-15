class AddDateTimeToTwitterDailyReports < ActiveRecord::Migration
  def change
    add_column :twitter_daily_reports, :date_time, :datetime
  end
end
