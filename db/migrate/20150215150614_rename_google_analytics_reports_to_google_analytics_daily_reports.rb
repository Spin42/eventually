class RenameGoogleAnalyticsReportsToGoogleAnalyticsDailyReports < ActiveRecord::Migration
  def change
    remove_index :google_analytics_reports, :google_analytics_view_id
    rename_table :google_analytics_reports, :google_analytics_daily_reports
    add_index :google_analytics_daily_reports, :google_analytics_view_id, name: "index_g_a_d_r_on_google_analytics_view_id"
  end
end
