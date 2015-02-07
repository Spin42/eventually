class CreateTwitterDailyReports < ActiveRecord::Migration
  def change
    create_table :twitter_daily_reports do |t|
      t.string :twitter_id, index: true
      t.string :screen_name
      t.string :name
      t.integer :followers_count
      t.integer :friends_count
      t.integer :statuses_count
      t.integer :favourites_count

      t.integer :value_count

      t.timestamps null: false
    end
  end
end
