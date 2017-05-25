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

ActiveRecord::Schema.define(version: 20170522220251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["ticket_id"], name: "index_comments_on_ticket_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.index ["ticket_id"], name: "index_departments_on_ticket_id", using: :btree
    t.index ["user_id"], name: "index_departments_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "grand_total"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "aasm_state"
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "skus", force: :cascade do |t|
    t.string   "item"
    t.float    "unit"
    t.float    "amount"
    t.float    "total"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_skus_on_order_id", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.string   "rep",           default: "Unassigned"
    t.string   "flag",          default: "square"
    t.string   "status",        default: "Open"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
    t.integer  "department_id"
    t.index ["department_id"], name: "index_tickets_on_department_id", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "department_id"
    t.string   "profile_pic"
    t.boolean  "is_admin",               default: false
    t.boolean  "is_staff",               default: false
    t.boolean  "is_client",              default: true
    t.index ["department_id"], name: "index_users_on_department_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "tickets"
  add_foreign_key "comments", "users"
  add_foreign_key "departments", "tickets"
  add_foreign_key "departments", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "skus", "orders"
  add_foreign_key "tickets", "departments"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "departments"
end
