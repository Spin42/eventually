class CreateEventStoreReports < ActiveRecord::Migration
  def change
    create_table :event_store_reports do |t|
      t.decimal :events_inserted, precision: 64, scale: 0
      t.decimal :events_updated, precision: 64, scale: 0
      t.decimal :events_deleted, precision: 64, scale: 0
      t.decimal :events_fetched_sequential_scans, precision: 64, scale: 0
      t.decimal :events_fetched_index_scans, precision: 64, scale: 0
      t.decimal :live_events, precision: 64, scale: 0
      t.decimal :live_reports, precision: 64, scale: 0

      t.timestamps null: false
    end
  end
end
