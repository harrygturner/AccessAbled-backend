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

ActiveRecord::Schema.define(version: 2019_03_14_174028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "about_attraction"
    t.float "long"
    t.float "lat"
    t.boolean "dis_parking"
    t.string "car_park"
    t.string "accessability"
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
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.integer "user_id"
    t.integer "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "like_count", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
