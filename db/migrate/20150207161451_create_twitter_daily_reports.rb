class CreateTwitterDailyReports < ActiveRecord::Migration
  def change
    create_table :twitter_daily_reports do |t|
      t.string :twitter_id, index: true
      t.string :screen_name
      t.string :name
      t.integer :followers, default: 0
      t.integer :friends, default: 0
      t.integer :statuses, default: 0
      t.integer :favourites, default: 0
      t.integer :values, default: 0

      t.timestamps null: false
    end
  end
end
