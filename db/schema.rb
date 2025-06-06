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

ActiveRecord::Schema[8.0].define(version: 2025_05_26_005349) do
  create_table "staff_group_memberships", force: :cascade do |t|
    t.integer "staff_user_id", null: false
    t.integer "staff_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_group_id"], name: "index_staff_group_memberships_on_staff_group_id"
    t.index ["staff_user_id"], name: "index_staff_group_memberships_on_staff_user_id"
  end

  create_table "staff_groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_staff_groups_on_name", unique: true
  end

  create_table "staff_groups_users", id: false, force: :cascade do |t|
    t.integer "staff_user_id"
    t.integer "staff_group_id"
    t.index ["staff_group_id"], name: "index_staff_groups_users_on_staff_group_id"
    t.index ["staff_user_id"], name: "index_staff_groups_users_on_staff_user_id"
  end

  create_table "staff_users", force: :cascade do |t|
    t.string "name"
    t.string "account"
    t.string "display_name"
    t.boolean "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "staff_group_memberships", "staff_groups"
  add_foreign_key "staff_group_memberships", "staff_users"
end
