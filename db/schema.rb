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

ActiveRecord::Schema[7.0].define(version: 2022_09_14_084011) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "quests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.integer "status", default: 0
    t.decimal "latitude", null: false
    t.decimal "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_quests_on_shop_id"
    t.index ["user_id"], name: "index_quests_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "latitude", null: false
    t.decimal "longitude", null: false
    t.string "opening_hours"
    t.string "address", null: false
    t.string "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "avalability", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "earned_money", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "quests", "shops"
  add_foreign_key "quests", "users"
end
