class CreateSidekiqReports < ActiveRecord::Migration
  def change
    create_table :sidekiq_reports do |t|
      t.integer :processed
      t.integer :failed
      t.integer :scheduled_size
      t.integer :retry_size
      t.integer :dead_size
      t.integer :processes_size
      t.integer :default_queue_latency
      t.integer :workers_size
      t.integer :enqueued

      t.timestamps null: false
    end
  end
end
