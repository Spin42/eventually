class CreateNewRelicApplicationReports < ActiveRecord::Migration
  def change
    create_table :new_relic_application_reports do |t|
      t.string :name
      t.string :new_relic_id
      t.string :health_status
      t.string :reporting
      t.datetime :last_reported_at
      t.decimal :response_time, precision: 15, scale: 2
      t.decimal :throughput, precision: 4, scale: 2
      t.decimal :error_rate, precision: 4, scale: 2
      t.decimal :apdex_target, precision: 4, scale: 2
      t.decimal :apdex_score, precision: 4, scale: 2
      t.integer :host_count
      t.integer :instance_count

      t.timestamps null: false
    end
  end
end
