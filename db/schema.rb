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

ActiveRecord::Schema[8.1].define(version: 2026_10_23_043129) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "colors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_colors_on_name", unique: true
  end

  create_table "horses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "personality"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "color_id"
    t.index ["color_id"], name: "index_horses_on_color_id"
    t.index ["name"], name: "index_horses_on_name"
    t.index ["user_id"], name: "index_horses_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "feature"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "horse_id"
    t.bigint "instructor_id"
    t.date "date", null: false
    t.text "instruction"
    t.text "impression"
    t.text "next_goal"
    t.boolean "is_public", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["horse_id"], name: "index_lessons_on_horse_id"
    t.index ["instructor_id"], name: "index_lessons_on_instructor_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.text "introduction"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "horses", "colors"
  add_foreign_key "horses", "users"
  add_foreign_key "instructors", "users"
  add_foreign_key "lessons", "horses"
  add_foreign_key "lessons", "instructors"
  add_foreign_key "lessons", "users"
end
