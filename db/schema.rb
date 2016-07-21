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

ActiveRecord::Schema.define(version: 20160722172446) do

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_activities_on_lesson_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "caterories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.integer  "caterory_user_id"
    t.integer  "caterory_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["caterory_id"], name: "index_lessons_on_caterory_id"
  end

  create_table "results", force: :cascade do |t|
    t.string   "string"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.integer  "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_results_on_lesson_id"
    t.index ["user_id"], name: "index_results_on_user_id"
    t.index ["word_id"], name: "index_results_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "password"
    t.date     "birthday"
    t.boolean  "admin"
  end

  create_table "words", force: :cascade do |t|
    t.string   "learning_word"
    t.string   "meaning"
    t.string   "meaning_token"
    t.integer  "caterory_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["caterory_id"], name: "index_words_on_caterory_id"
  end

end
