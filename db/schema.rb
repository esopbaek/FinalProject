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

ActiveRecord::Schema.define(version: 20140930010855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cardio_exercises", force: true do |t|
    t.string   "name",        null: false
    t.integer  "minutes"
    t.integer  "cals_burned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "comment",    null: false
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "diary_pages", force: true do |t|
    t.date     "entry_date", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diary_pages", ["user_id"], name: "index_diary_pages_on_user_id", using: :btree

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

  create_table "exercise_diary_pages", force: true do |t|
    t.date     "exercise_entry_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercise_diary_pages", ["user_id"], name: "index_exercise_diary_pages_on_user_id", using: :btree

  create_table "exercise_entries", force: true do |t|
    t.integer  "exercise_diary_page_id"
    t.integer  "cardio_exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercise_entries", ["cardio_exercise_id"], name: "index_exercise_entries_on_cardio_exercise_id", using: :btree
  add_index "exercise_entries", ["exercise_diary_page_id"], name: "index_exercise_entries_on_exercise_diary_page_id", using: :btree

  create_table "food_entries", force: true do |t|
    t.integer  "diary_page_id"
    t.integer  "food_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meal"
  end

  add_index "food_entries", ["diary_page_id"], name: "index_food_entries_on_diary_page_id", using: :btree
  add_index "food_entries", ["food_id"], name: "index_food_entries_on_food_id", using: :btree

  create_table "foods", force: true do |t|
    t.string   "name",                                null: false
    t.integer  "calories",               default: 0
    t.integer  "total_fat",              default: 0
    t.integer  "saturated",              default: 0
    t.integer  "polyunsaturated",        default: 0
    t.integer  "monounsaturated",        default: 0
    t.integer  "trans",                  default: 0
    t.integer  "cholesterol",            default: 0
    t.integer  "sodium",                 default: 0
    t.integer  "carbs",                  default: 0
    t.integer  "fiber",                  default: 0
    t.integer  "vitamin_a",              default: 0
    t.integer  "vitamin_c",              default: 0
    t.integer  "calcium",                default: 0
    t.integer  "iron",                   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "serving_size"
    t.integer  "servings_per_container", default: 1
    t.string   "brand"
    t.string   "meal",                   default: ""
    t.integer  "protein",                default: 0
    t.integer  "sugar",                  default: 0
    t.integer  "serving_size_qty",       default: 0
  end

  create_table "likes", force: true do |t|
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "likes", ["likeable_id"], name: "index_likes_on_likeable_id", using: :btree

  create_table "logs", force: true do |t|
    t.integer  "measurement_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["measurement_id"], name: "index_logs_on_measurement_id", using: :btree

  create_table "measurements", force: true do |t|
    t.string   "name",       null: false
    t.string   "unit"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.text     "content",     null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "poster_id"
    t.string   "poster_name"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "social_profiles", force: true do |t|
    t.integer  "age",                     null: false
    t.string   "gender",                  null: false
    t.text     "about_me",   default: ""
    t.text     "why",        default: ""
    t.text     "inspir1",    default: ""
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country",    default: ""
    t.string   "state",      default: ""
    t.string   "city",       default: ""
    t.integer  "zip",        default: 0
    t.string   "page_title", default: ""
  end

  add_index "social_profiles", ["user_id"], name: "index_social_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                   null: false
    t.string   "password_digest",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token",              null: false
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
