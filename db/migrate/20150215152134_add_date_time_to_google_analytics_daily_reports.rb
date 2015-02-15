class AddDateTimeToGoogleAnalyticsDailyReports < ActiveRecord::Migration
  def change
    add_column :google_analytics_daily_reports, :date_time, :datetime
  end
end
