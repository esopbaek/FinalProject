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

ActiveRecord::Schema.define(version: 20140625202430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diet_profiles", force: true do |t|
    t.integer  "current_weight",    null: false
    t.integer  "goal_weight",       null: false
    t.integer  "height_ft",         null: false
    t.integer  "height_in",         null: false
    t.string   "gender",            null: false
    t.string   "activity_level",    null: false
    t.integer  "workouts_per_week"
    t.integer  "mins_per_workout"
    t.integer  "user_id",           null: false
    t.date     "d_o_b",             null: false
    t.string   "goal_rate",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.string   "name",          null: false
    t.integer  "minutes_spent", null: false
    t.integer  "cals_burned",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", force: true do |t|
    t.string   "name",                        null: false
    t.integer  "calories",        default: 0
    t.integer  "total_fat",       default: 0
    t.integer  "saturated",       default: 0
    t.integer  "polyunsaturated", default: 0
    t.integer  "monounsaturated", default: 0
    t.integer  "trans",           default: 0
    t.integer  "cholesterol",     default: 0
    t.integer  "sodium",          default: 0
    t.integer  "potassium",       default: 0
    t.integer  "carbs",           default: 0
    t.integer  "fiber",           default: 0
    t.integer  "vitamin_a",       default: 0
    t.integer  "vitamin_c",       default: 0
    t.integer  "calcium",         default: 0
    t.integer  "iron",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.integer  "measurement_id"
    t.integer  "unit"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurements", force: true do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "measurements", ["user_id"], name: "index_measurements_on_user_id", using: :btree

  create_table "social_profiles", force: true do |t|
    t.integer  "age",                     null: false
    t.string   "gender",                  null: false
    t.text     "about_me",   default: ""
    t.text     "why",        default: ""
    t.text     "inspir1",    default: ""
    t.text     "inspir2",    default: ""
    t.text     "inspir3",    default: ""
    t.text     "inspir4",    default: ""
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "social_profiles", ["user_id"], name: "index_social_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token",   null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
