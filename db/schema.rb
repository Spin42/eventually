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

ActiveRecord::Schema.define(version: 20150215152134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_bus_reports", force: :cascade do |t|
    t.string   "queue"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_store_reports", force: :cascade do |t|
    t.decimal  "events_inserted",                 precision: 64
    t.decimal  "events_updated",                  precision: 64
    t.decimal  "events_deleted",                  precision: 64
    t.decimal  "events_fetched_sequential_scans", precision: 64
    t.decimal  "events_fetched_index_scans",      precision: 64
    t.decimal  "live_events",                     precision: 64
    t.decimal  "live_reports",                    precision: 64
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "source_name"
    t.text     "name"
    t.json     "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["name"], name: "index_events_on_name", using: :btree
  add_index "events", ["source_name"], name: "index_events_on_source_name", using: :btree

  create_table "google_analytics_daily_reports", force: :cascade do |t|
    t.string   "google_analytics_view_id"
    t.integer  "total_visits"
    t.integer  "direct_visits"
    t.integer  "organic_search_visits"
    t.integer  "referral_visits"
    t.integer  "social_visits"
    t.integer  "total_users"
    t.integer  "new_users"
    t.integer  "returning_users"
    t.decimal  "average_server_response_time", precision: 15, scale: 2
    t.decimal  "average_page_download_time",   precision: 15, scale: 2
    t.decimal  "average_page_load_time",       precision: 15, scale: 2
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.datetime "date_time"
  end

  add_index "google_analytics_daily_reports", ["google_analytics_view_id"], name: "index_g_a_d_r_on_google_analytics_view_id", using: :btree

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

  add_index "new_relic_application_reports", ["new_relic_id"], name: "index_new_relic_application_reports_on_new_relic_id", using: :btree

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

  add_index "new_relic_server_reports", ["new_relic_id"], name: "index_new_relic_server_reports_on_new_relic_id", using: :btree

  create_table "twitter_daily_reports", force: :cascade do |t|
    t.string   "twitter_id"
    t.string   "screen_name"
    t.string   "name"
    t.integer  "followers",   default: 0
    t.integer  "friends",     default: 0
    t.integer  "statuses",    default: 0
    t.integer  "favourites",  default: 0
    t.integer  "values",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "twitter_daily_reports", ["twitter_id"], name: "index_twitter_daily_reports_on_twitter_id", using: :btree

  create_table "twitter_reports", force: :cascade do |t|
    t.string   "twitter_id"
    t.string   "screen_name"
    t.string   "name"
    t.integer  "followers",   default: 0
    t.integer  "friends",     default: 0
    t.integer  "statuses",    default: 0
    t.integer  "favourites",  default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "twitter_reports", ["twitter_id"], name: "index_twitter_reports_on_twitter_id", using: :btree

end
