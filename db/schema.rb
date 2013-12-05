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

ActiveRecord::Schema.define(version: 20131203214129) do

  create_table "behaviors", force: true do |t|
    t.integer  "pos1"
    t.integer  "neg1"
    t.integer  "neg2"
    t.integer  "cor1"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "record_time"
    t.integer  "pos2"
    t.integer  "pos3"
    t.integer  "pos4"
    t.integer  "neg3"
    t.integer  "neg4"
    t.integer  "neg5"
    t.integer  "neg6"
    t.integer  "neg7"
    t.integer  "neg8"
    t.integer  "neg9"
    t.integer  "neg10"
    t.integer  "neg11"
    t.integer  "neg12"
    t.integer  "neg13"
    t.integer  "neg14"
    t.integer  "neg15"
    t.integer  "neg16"
    t.integer  "cor2"
    t.integer  "cor3"
    t.integer  "cor4"
  end

  add_index "behaviors", ["record_time"], name: "index_behaviors_on_record_time"
  add_index "behaviors", ["student_id"], name: "index_behaviors_on_student_id"

  create_table "prospects", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prospects", ["email"], name: "index_prospects_on_email", unique: true

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "student_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["student_id"], name: "index_students_on_student_id", unique: true
  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
