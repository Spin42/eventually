class CreateTwitterReports < ActiveRecord::Migration
  def change
    create_table :twitter_reports do |t|
      t.string :twitter_id, index: true
      t.string :screen_name, index: true
      t.string :name
      t.integer :followers_count
      t.integer :friends_count
      t.integer :statuses_count
      t.integer :favourites_count

      t.timestamps null: false
    end
  end
end
