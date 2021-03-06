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

ActiveRecord::Schema.define(version: 2019_06_08_152301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "participant_registries", force: :cascade do |t|
    t.bigint "registry_id"
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_participant_registries_on_participant_id"
    t.index ["registry_id"], name: "index_participant_registries_on_registry_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.date "birthday"
    t.integer "contact_method"
    t.string "notes"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "registries", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.boolean "open", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_registries", force: :cascade do |t|
    t.bigint "registry_id"
    t.bigint "user_id"
    t.index ["registry_id"], name: "index_user_registries_on_registry_id"
    t.index ["user_id"], name: "index_user_registries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "participant_registries", "participants"
  add_foreign_key "participant_registries", "registries"
  add_foreign_key "participants", "users"
  add_foreign_key "user_registries", "registries"
  add_foreign_key "user_registries", "users"
end
