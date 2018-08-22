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

ActiveRecord::Schema.define(version: 2018_08_22_020954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lunch_dates", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "second_user_id"
    t.bigint "restaurant_id"
    t.datetime "begin"
    t.integer "suggested_duration"
    t.string "lunch_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_lunch_dates_on_restaurant_id"
    t.index ["second_user_id"], name: "index_lunch_dates_on_second_user_id"
    t.index ["user_id"], name: "index_lunch_dates_on_user_id"
  end

  create_table "lunch_requests", force: :cascade do |t|
    t.datetime "datetime"
    t.integer "suggested_duration"
    t.string "lunch_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true, null: false
    t.float "latitude", default: 0.0, null: false
    t.float "longitude", default: 0.0, null: false
    t.string "address", default: "Yemen Road", null: false
    t.index ["user_id"], name: "index_lunch_requests_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.text "description"
    t.string "cuisine"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "birthday"
    t.boolean "smoking"
    t.text "bio"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lunch_dates", "restaurants"
end
