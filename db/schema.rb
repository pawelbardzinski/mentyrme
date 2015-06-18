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

ActiveRecord::Schema.define(version: 20150615122555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availability_period_time_slots", id: false, force: :cascade do |t|
    t.integer "availability_period_id"
    t.integer "time_slot_id"
  end

  create_table "availability_periods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time     "start_time"
    t.time     "end_time"
  end

  create_table "availability_periods_day_availabilities", id: false, force: :cascade do |t|
    t.integer "day_availability_id"
    t.integer "availability_period_id"
  end

  add_index "availability_periods_day_availabilities", ["day_availability_id", "availability_period_id"], name: "unique_availability_xref", unique: true, using: :btree

  create_table "bookings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.boolean  "online_meeting"
    t.integer  "category_id"
    t.integer  "mentor_id"
    t.integer  "mentee_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "aasm_state",     default: "started"
  end

  create_table "bookings_tags", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "booking_id"
  end

  add_index "bookings_tags", ["booking_id"], name: "index_bookings_tags_on_booking_id", using: :btree
  add_index "bookings_tags", ["tag_id"], name: "index_bookings_tags_on_tag_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url_slug"
  end

  create_table "day_availabilities", force: :cascade do |t|
    t.integer  "day_number"
    t.integer  "profile_id"
    t.integer  "availability_period_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "day_availabilities_time_slots", id: false, force: :cascade do |t|
    t.integer "day_availability_id"
    t.integer "time_slot_id"
    t.integer "part_id"
  end

  add_index "day_availabilities_time_slots", ["day_availability_id"], name: "index_day_availabilities_time_slots_on_day_availability_id", using: :btree
  add_index "day_availabilities_time_slots", ["part_id"], name: "index_day_availabilities_time_slots_on_part_id", using: :btree
  add_index "day_availabilities_time_slots", ["time_slot_id"], name: "index_day_availabilities_time_slots_on_time_slot_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "photoable_id"
    t.string   "photoable_type"
    t.string   "caption"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "one_line_description"
    t.text     "expertise_description"
    t.text     "sales_pitch"
    t.string   "employer"
    t.string   "school"
    t.string   "languages"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "rates", force: :cascade do |t|
    t.string   "type"
    t.integer  "skill_id"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "category_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profile_id"
  end

  create_table "skills_tags", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "skill_id"
  end

  add_index "skills_tags", ["skill_id"], name: "index_skills_tags_on_skill_id", using: :btree
  add_index "skills_tags", ["tag_id"], name: "index_skills_tags_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "time_slots", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pay_to_mentor_id"
    t.string   "title"
    t.decimal  "amount",                   default: 0.0
    t.string   "state",                    default: "future"
    t.string   "braintree_transaction_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "zip_code"
    t.string   "braintree_id"
    t.string   "default_card_id"
    t.string   "merchant_account_id"
    t.integer  "role",                   default: 0
    t.boolean  "wants_notifications",    default: false
    t.boolean  "is_active",              default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "validations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "value_label"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "verifications", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "validation_id"
    t.integer  "verified_by_user_id"
    t.string   "validation_value"
    t.text     "note"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_foreign_key "transactions", "users"
end
