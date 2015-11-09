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

ActiveRecord::Schema.define(version: 20151109052827) do

  create_table "cases", force: :cascade do |t|
    t.integer  "case_number"
    t.integer  "mediator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "costs", force: :cascade do |t|
    t.string   "title"
    t.decimal  "amount"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "due"
    t.boolean  "paid"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.time     "time"
    t.integer  "parent_id"
    t.integer  "child_id"
    t.integer  "mediator_id"
    t.boolean  "pending"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string   "title"
    t.decimal  "amount"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "paid_at"
    t.integer  "cost_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "address"
    t.integer  "phone_number"
    t.string   "child_name"
    t.integer  "case_number"
    t.string   "mediator_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_cases", force: :cascade do |t|
    t.integer  "case_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "type"
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.integer  "phone_number"
    t.integer  "case_number"
    t.integer  "case_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
