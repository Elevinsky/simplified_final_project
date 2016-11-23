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

ActiveRecord::Schema.define(version: 20161123013413) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "breaks", force: :cascade do |t|
    t.integer  "trainer_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cancellation_notes", force: :cascade do |t|
    t.integer  "lesson_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "trainer_id"
    t.integer  "student_id"
    t.datetime "lesson_time"
    t.boolean  "checked_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_adjustments", force: :cascade do |t|
    t.integer  "trainer_id"
    t.datetime "adjusted_start"
    t.datetime "adjusted_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.integer  "pin"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "name"
    t.integer  "tues_start_hour"
    t.integer  "tues_start_min"
    t.string   "tues_start_am_pm"
    t.integer  "wed_start_hour"
    t.integer  "wed_start_min"
    t.string   "wed_start_am_pm"
    t.integer  "thur_start_hour"
    t.integer  "thur_start_min"
    t.string   "thur_start_am_pm"
    t.integer  "fri_start_hour"
    t.integer  "fri_start_min"
    t.string   "fri_start_am_pm"
    t.integer  "sat_start_hour"
    t.integer  "sat_start_min"
    t.string   "sat_start_am_pm"
    t.integer  "sun_start_hour"
    t.integer  "sun_start_min"
    t.string   "sun_start_am_pm"
    t.integer  "tues_end_hour"
    t.integer  "tues_end_min"
    t.string   "tues_end_am_pm"
    t.integer  "wed_end_hour"
    t.integer  "wed_end_min"
    t.string   "wed_end_am_pm"
    t.integer  "thur_end_hour"
    t.integer  "thur_end_min"
    t.string   "thur_end_am_pm"
    t.integer  "fri_end_hour"
    t.integer  "fri_end_min"
    t.string   "fri_end_am_pm"
    t.integer  "sat_end_hour"
    t.integer  "sat_end_min"
    t.string   "sat_end_am_pm"
    t.integer  "sun_end_hour"
    t.integer  "sun_end_min"
    t.string   "sun_end_am_pm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end