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

ActiveRecord::Schema.define(version: 20160310181752) do

  create_table "challenge_solutions", force: :cascade do |t|
    t.integer  "challenge_id",                null: false
    t.string   "answer",                      null: false
    t.boolean  "truth",        default: true, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "challenge_solutions", ["challenge_id"], name: "index_challenge_solutions_on_challenge_id"
  add_index "challenge_solutions", ["truth"], name: "index_challenge_solutions_on_truth"

  create_table "challenges", force: :cascade do |t|
    t.string   "name"
    t.integer  "place_id",                       null: false
    t.integer  "difficulty",         default: 1, null: false
    t.text     "question",                       null: false
    t.float    "lat"
    t.float    "lng"
    t.text     "additional_content"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "challenges", ["difficulty"], name: "index_challenges_on_difficulty"
  add_index "challenges", ["lat", "lng"], name: "index_challenges_on_lat_and_lng"
  add_index "challenges", ["place_id"], name: "index_challenges_on_place_id"

  create_table "challenges_protocols", force: :cascade do |t|
    t.integer  "challenge_user_id", null: false
    t.integer  "state"
    t.integer  "hint_id"
    t.float    "lat"
    t.float    "lng"
    t.string   "answer"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "challenges_protocols", ["challenge_user_id"], name: "index_challenges_protocols_on_challenge_user_id"
  add_index "challenges_protocols", ["state"], name: "index_challenges_protocols_on_state"

  create_table "challenges_users", force: :cascade do |t|
    t.integer  "challenge_id", null: false
    t.integer  "user_id",      null: false
    t.integer  "state"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "challenges_users", ["challenge_id"], name: "index_challenges_users_on_challenge_id"
  add_index "challenges_users", ["state"], name: "index_challenges_users_on_state"
  add_index "challenges_users", ["user_id"], name: "index_challenges_users_on_user_id"

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.integer  "country_id", null: false
    t.float    "lat"
    t.float    "lng"
    t.string   "zip_from"
    t.string   "zip_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id"
  add_index "cities", ["name"], name: "index_cities_on_name"
  add_index "cities", ["slug"], name: "index_cities_on_slug", unique: true

  create_table "countries", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "iso_code",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hints", force: :cascade do |t|
    t.integer  "challenge_id", null: false
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "hints", ["challenge_id"], name: "index_hints_on_challenge_id"

  create_table "places", force: :cascade do |t|
    t.integer  "city_id",                   null: false
    t.string   "name",                      null: false
    t.text     "description"
    t.string   "street"
    t.string   "street_number"
    t.string   "zip_code"
    t.string   "district"
    t.float    "lat"
    t.float    "lng"
    t.string   "homepage"
    t.string   "email"
    t.integer  "place_type",    default: 0, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_tours", id: false, force: :cascade do |t|
    t.integer  "tag_id",     null: false
    t.integer  "tour_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags_tours", ["tag_id"], name: "index_tags_tours_on_tag_id"
  add_index "tags_tours", ["tour_id"], name: "index_tags_tours_on_tour_id"

  create_table "tags_users", id: false, force: :cascade do |t|
    t.integer  "tag_id",     null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags_users", ["tag_id"], name: "index_tags_users_on_tag_id"
  add_index "tags_users", ["user_id"], name: "index_tags_users_on_user_id"

  create_table "tour_places", force: :cascade do |t|
    t.integer  "place_id",                     null: false
    t.integer  "tour_id",                      null: false
    t.integer  "default_position", default: 0, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "tour_places", ["place_id"], name: "index_tour_places_on_place_id"
  add_index "tour_places", ["tour_id"], name: "index_tour_places_on_tour_id"

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id",     null: false
    t.string   "slug"
    t.integer  "rating"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tours", ["city_id"], name: "index_tours_on_city_id"
  add_index "tours", ["rating"], name: "index_tours_on_rating"

  create_table "user_tour_places", force: :cascade do |t|
    t.integer  "place_id",                     null: false
    t.integer  "user_tour_id",                 null: false
    t.integer  "position",     default: 0,     null: false
    t.boolean  "visited",      default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "user_tour_places", ["place_id"], name: "index_user_tour_places_on_place_id"
  add_index "user_tour_places", ["user_tour_id"], name: "index_user_tour_places_on_user_tour_id"
  add_index "user_tour_places", ["visited"], name: "index_user_tour_places_on_visited"

  create_table "user_tours", force: :cascade do |t|
    t.integer  "tour_id",                    null: false
    t.integer  "user_id",                    null: false
    t.boolean  "completed",  default: false, null: false
    t.integer  "rating"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "user_tours", ["completed"], name: "index_user_tours_on_completed"
  add_index "user_tours", ["tour_id"], name: "index_user_tours_on_tour_id"
  add_index "user_tours", ["user_id"], name: "index_user_tours_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.integer  "role",            default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["role"], name: "index_users_on_role"

end
