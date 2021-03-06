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

ActiveRecord::Schema.define(version: 20180308202421) do

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.float "rating"
    t.text "bio"
    t.string "gender"
    t.integer "age"
    t.string "dob"
    t.string "pob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "ratings"
  end

  create_table "appearances", force: :cascade do |t|
    t.integer "show_id"
    t.integer "actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.text "characters"
    t.text "cast"
    t.string "title"
    t.string "streamed_on"
    t.string "status"
    t.string "genres"
    t.integer "episodes_ordered"
    t.string "created_by"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "ratings"
    t.text "description"
  end

  create_table "user_actors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_shows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

end
