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

ActiveRecord::Schema.define(version: 20170430230859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.index ["name"], name: "index_groups_on_name"
  end

  create_table "people", id: :string, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "gender"
    t.boolean "alive"
    t.string "lifespan"
    t.index ["first_name"], name: "index_people_on_first_name"
    t.index ["last_name"], name: "index_people_on_last_name"
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", default: -> { "now()" }
    t.index ["email"], name: "index_users_on_email"
  end

end
