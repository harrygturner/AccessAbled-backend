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

ActiveRecord::Schema.define(version: 2019_03_28_074343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessible_stations", force: :cascade do |t|
    t.string "name"
    t.string "accessibility_type"
    t.string "lift_access"
    t.string "limited_cap_lift"
    t.string "additional_access_info"
    t.string "bus_route_accessible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "taxi_rank"
    t.string "accessible_toilet"
    t.string "accessible_toilet_note"
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "about_attraction"
    t.float "long"
    t.float "lat"
    t.boolean "dis_parking"
    t.string "car_park"
    t.string "accessibility"
    t.string "door_type"
    t.string "hearing_assistance"
    t.string "counter_height"
    t.string "lifts"
    t.string "chair_manouverability"
    t.string "dis_toilets"
    t.string "reduce_fees"
    t.string "staff_training"
    t.string "assistance_dogs"
    t.boolean "braille_doc"
    t.string "large_print_doc"
    t.string "mob_allowed"
    t.string "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "image_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nearby_stations", force: :cascade do |t|
    t.integer "attraction_id"
    t.integer "accessible_station_id"
    t.float "long"
    t.float "lat"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.integer "user_id"
    t.integer "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "like_count", default: 0
    t.string "title"
  end

  create_table "stops", force: :cascade do |t|
    t.string "line"
    t.integer "step_min"
    t.integer "step_max"
    t.integer "gap_min"
    t.integer "gap_max"
    t.string "level_access_by_ramp"
    t.integer "platform"
    t.string "direction_towards"
    t.string "direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "accessible_station_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
