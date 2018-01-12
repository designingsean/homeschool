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

ActiveRecord::Schema.define(version: 20180111051251) do

  create_table "books", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "author", null: false
    t.string "title", null: false
    t.integer "subject_id"
    t.index ["subject_id"], name: "fk_rails_7b383e10ff"
  end

  create_table "grades", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "grade", null: false
  end

  create_table "logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "subject_id", null: false
    t.integer "teacher_id", null: false
    t.date "date", null: false
    t.text "description"
    t.integer "book_id"
    t.integer "record_id", null: false
    t.index ["book_id"], name: "index_logs_on_book_id"
    t.index ["subject_id"], name: "index_logs_on_subject_id"
    t.index ["teacher_id"], name: "index_logs_on_teacher_id"
  end

  create_table "records", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id", null: false
    t.integer "year_id", null: false
    t.integer "grade_id", null: false
    t.index ["grade_id"], name: "index_records_on_grade_id"
    t.index ["student_id"], name: "index_records_on_student_id"
    t.index ["year_id"], name: "index_records_on_year_id"
  end

  create_table "students", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first", limit: 20, null: false
    t.string "last", limit: 20, null: false
  end

  create_table "subjects", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "subject", limit: 20, null: false
  end

  create_table "teachers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first", limit: 20, null: false
    t.string "last", limit: 20, null: false
  end

  create_table "years", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "year", limit: 9, null: false
    t.datetime "start_date"
    t.datetime "end_date"
  end

  add_foreign_key "books", "subjects"
  add_foreign_key "logs", "books"
  add_foreign_key "logs", "subjects"
  add_foreign_key "logs", "teachers"
  add_foreign_key "records", "grades"
  add_foreign_key "records", "students"
  add_foreign_key "records", "years"
end
