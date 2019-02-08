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

ActiveRecord::Schema.define(version: 2019_02_08_215159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_updates", force: :cascade do |t|
    t.integer "comment_id"
    t.datetime "update_date"
    t.datetime "update_time"
    t.string "update_type"
    t.string "current_update"
    t.string "employee_name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "visit_date"
    t.time "visit_time"
    t.string "comment_type"
    t.string "source"
    t.string "urgent"
    t.string "case_number"
    t.string "first_issue"
    t.string "first_issue_comment"
    t.string "second_issue"
    t.string "second_issue_comment"
    t.string "third_issue"
    t.string "third_issue_comment"
    t.string "contact_type"
    t.string "visit_type"
    t.string "employee_named"
    t.string "status", default: "Open"
    t.integer "guest_id"
    t.integer "store_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "store_number"
    t.string "store_type"
    t.string "store_email"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "phone"
    t.integer "owner_id"
    t.integer "director_id"
    t.integer "om_id"
    t.integer "supervisor_id"
    t.integer "gm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "position"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
