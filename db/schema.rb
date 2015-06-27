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

ActiveRecord::Schema.define(version: 20150627151053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.string   "name"
    t.string   "slack_id"
    t.string   "slack_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leave_balances", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "leave_type_id"
    t.integer  "balance"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "leave_requests", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "leave_type_id"
    t.date     "from"
    t.date     "to"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "leave_reviews", force: :cascade do |t|
    t.integer  "leave_request_id"
    t.integer  "employee_id"
    t.string   "comment"
    t.boolean  "is_approved"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "leave_types", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "quota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "channel_name"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "company_name"
    t.string   "slack_api_token"
    t.string   "webhook_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "slack_token"
  end

end
