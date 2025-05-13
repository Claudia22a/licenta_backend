# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_13_164623) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "babies", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.string "gender"
    t.float "weight_at_birth"
    t.float "height_at_birth"
    t.string "blood_type"
    t.text "allergies"
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_babies_on_user_id"
  end

  create_table "log_entries", force: :cascade do |t|
    t.bigint "baby_id", null: false
    t.string "entry_type", null: false
    t.datetime "logged_at", default: -> { "now()" }, null: false
    t.text "notes"
    t.integer "duration"
    t.decimal "amount", precision: 6, scale: 2
    t.string "unit"
    t.string "location"
    t.string "mood"
    t.integer "diaper_type"
    t.integer "feeding_type"
    t.integer "sleep_type"
    t.integer "walk_type"
    t.integer "symptom_type"
    t.integer "tag_type"
    t.string "other_diaper_type"
    t.string "other_feeding_type"
    t.string "other_sleep_type"
    t.string "other_walk_type"
    t.string "other_symptom_type"
    t.string "other_tag_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["baby_id"], name: "index_log_entries_on_baby_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "babies", "users"
  add_foreign_key "log_entries", "babies"
end
