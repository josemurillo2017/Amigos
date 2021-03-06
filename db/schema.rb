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

ActiveRecord::Schema.define(version: 20180603030731) do

  create_table "flag_infos", force: :cascade do |t|
    t.string "flag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flags", force: :cascade do |t|
    t.integer "flag_id"
    t.integer "member_id"
    t.boolean "solution_in_process"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_infos", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "sat_score"
    t.integer "act_score"
    t.float "gpa"
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
