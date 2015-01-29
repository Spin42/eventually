class CreateNewRelicServerReports < ActiveRecord::Migration
  def change
    create_table :new_relic_server_reports do |t|
      t.string :name
      t.string :new_relic_id
      t.string :health_status
      t.string :reporting
      t.datetime :last_reported_at
      t.decimal :cpu, precision: 4, scale: 2
      t.decimal :cpu_stolen, precision: 4, scale: 2
      t.decimal :disk_io, precision: 4, scale: 2
      t.decimal :memory, precision: 4, scale: 2
      t.decimal :memory_used, precision: 20, scale: 0
      t.decimal :memory_total, precision: 20, scale: 0
      t.decimal :fullest_disk, precision: 4, scale: 2
      t.decimal :fullest_disk_free, precision: 20, scale: 0

      t.timestamps null: false
    end
  end
end
