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

ActiveRecord::Schema[8.0].define(version: 2025_06_22_050527) do
  create_table "acts", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true, null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "task_id", null: false
    t.index ["task_id"], name: "index_acts_on_task_id"
  end

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

  create_table "task_assignments", force: :cascade do |t|
    t.integer "task_id"
    t.string "assignee_type"
    t.integer "assignee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_type", "assignee_id"], name: "index_task_assignments_on_assignee"
    t.index ["task_id", "assignee_id", "assignee_type"], name: "idx_on_task_id_assignee_id_assignee_type_6082fffcef", unique: true
    t.index ["task_id"], name: "index_task_assignments_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "draft", default: true, null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
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

  add_foreign_key "acts", "tasks"
  add_foreign_key "staff_group_memberships", "staff_groups"
  add_foreign_key "staff_group_memberships", "staff_users"
  add_foreign_key "task_assignments", "tasks"
  add_foreign_key "tasks", "users"
end
