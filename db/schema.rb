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

ActiveRecord::Schema.define(version: 20160209134846) do

  create_table "books", force: :cascade do |t|
    t.string  "author",     limit: 255, null: false
    t.string  "title",      limit: 255, null: false
    t.integer "subject_id", limit: 4
  end

  add_index "books", ["subject_id"], name: "fk_rails_7b383e10ff", using: :btree

  create_table "grades", force: :cascade do |t|
    t.integer "grade", limit: 4, null: false
  end

  create_table "logs", force: :cascade do |t|
    t.integer "subject_id",  limit: 4,                 null: false
    t.integer "teacher_id",  limit: 4,                 null: false
    t.date    "date",                                  null: false
    t.text    "description", limit: 65535
    t.integer "book_id",     limit: 4
    t.integer "student_id",  limit: 4,     default: 1, null: false
  end

  add_index "logs", ["book_id"], name: "index_logs_on_book_id", using: :btree
  add_index "logs", ["student_id"], name: "index_logs_on_student_id", using: :btree
  add_index "logs", ["subject_id"], name: "index_logs_on_subject_id", using: :btree
  add_index "logs", ["teacher_id"], name: "index_logs_on_teacher_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.integer "student_id", limit: 4, null: false
    t.integer "year_id",    limit: 4, null: false
    t.integer "grade_id",   limit: 4, null: false
  end

  add_index "records", ["grade_id"], name: "index_records_on_grade_id", using: :btree
  add_index "records", ["student_id"], name: "index_records_on_student_id", using: :btree
  add_index "records", ["year_id"], name: "index_records_on_year_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string "first", limit: 20, null: false
    t.string "last",  limit: 20, null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject", limit: 20, null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first", limit: 20, null: false
    t.string "last",  limit: 20, null: false
  end

  create_table "years", force: :cascade do |t|
    t.string "year", limit: 9, null: false
  end

  add_foreign_key "books", "subjects"
  add_foreign_key "logs", "books"
  add_foreign_key "logs", "students"
  add_foreign_key "logs", "subjects"
  add_foreign_key "logs", "teachers"
  add_foreign_key "records", "grades"
  add_foreign_key "records", "students"
  add_foreign_key "records", "years"
end
