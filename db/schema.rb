# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150128171914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "application_uid"
    t.string   "type"
    t.string   "model_name"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "action_uid"
    t.datetime "date_time"
    t.text     "data"
    t.text     "session_data"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "events", ["application_uid"], name: "index_events_on_application_uid", using: :btree
  add_index "events", ["type"], name: "index_events_on_type", using: :btree

  create_table "new_relic_application_reports", force: :cascade do |t|
    t.string   "name"
    t.string   "new_relic_id"
    t.string   "health_status"
    t.string   "reporting"
    t.datetime "last_reported_at"
    t.decimal  "response_time",    precision: 15, scale: 2
    t.decimal  "throughput",       precision: 4,  scale: 2
    t.decimal  "error_rate",       precision: 4,  scale: 2
    t.decimal  "apdex_target",     precision: 4,  scale: 2
    t.decimal  "apdex_score",      precision: 4,  scale: 2
    t.integer  "host_count"
    t.integer  "instance_count"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "new_relic_server_reports", force: :cascade do |t|
    t.string   "name"
    t.string   "new_relic_id"
    t.string   "health_status"
    t.string   "reporting"
    t.datetime "last_reported_at"
    t.decimal  "cpu",               precision: 4,  scale: 2
    t.decimal  "cpu_stolen",        precision: 4,  scale: 2
    t.decimal  "disk_io",           precision: 4,  scale: 2
    t.decimal  "memory",            precision: 4,  scale: 2
    t.decimal  "memory_used",       precision: 20
    t.decimal  "memory_total",      precision: 20
    t.decimal  "fullest_disk",      precision: 4,  scale: 2
    t.decimal  "fullest_disk_free", precision: 20
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

end
