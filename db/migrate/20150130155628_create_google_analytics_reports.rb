class CreateGoogleAnalyticsReports < ActiveRecord::Migration
  def change
    create_table :google_analytics_reports do |t|
      t.string :google_analytics_view_id, index: true
      t.integer :total_visits
      t.integer :direct_visits
      t.integer :organic_search_visits
      t.integer :referral_visits
      t.integer :social_visits
      t.integer :total_users
      t.integer :new_users
      t.integer :returning_users
      t.decimal :average_server_response_time, precision: 15, scale: 2
      t.decimal :average_page_download_time, precision: 15, scale: 2
      t.decimal :average_page_load_time, precision: 15, scale: 2

      t.timestamps null: false
    end
  end
end
