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

ActiveRecord::Schema.define(version: 20140624155851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
