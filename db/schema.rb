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

ActiveRecord::Schema.define(version: 20160814160337) do

  create_table "project_db_versions", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "version_db"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_headers", force: :cascade do |t|
    t.string   "name"
    t.integer  "version_db",   default: 0
    t.integer  "version_init", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "project_headers", ["name"], name: "index_project_headers_on_name"

  create_table "system_settings", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "system_settings", ["name"], name: "index_system_settings_on_name"

  create_table "table_headers", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "ttype"
    t.string   "value"
    t.integer  "x",          default: 10
    t.integer  "y",          default: 10
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "table_headers", ["project_id"], name: "index_table_headers_on_project_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",       default: "No Name"
    t.string   "account"
    t.string   "password"
    t.string   "permission", default: "user"
    t.string   "token"
    t.string   "mail"
    t.string   "challenge"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
