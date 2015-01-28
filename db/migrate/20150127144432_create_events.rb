class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :application_uid, index: true
      t.string :type, index: true
      t.string :model_name
      t.string :controller_name
      t.string :action_name
      t.string :action_uid
      t.datetime :date_time
      t.text :data
      t.text :session_data

      t.timestamps null: false
    end
  end
end
