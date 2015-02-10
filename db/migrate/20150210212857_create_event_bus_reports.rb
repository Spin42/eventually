class CreateEventBusReports < ActiveRecord::Migration
  def change
    create_table :event_bus_reports do |t|
      t.string :queue
      t.integer :size
      t.timestamps null: false
    end
  end
end
