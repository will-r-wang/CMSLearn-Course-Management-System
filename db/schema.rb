# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_15_024335) do

  create_table "announcement_managers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "course_id"
    t.index ["course_id"], name: "index_announcement_managers_on_course_id"
  end

  create_table "announcements", force: :cascade do |t|
    t.text "announcement_content"
    t.boolean "pinned"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "announcement_manager_id"
    t.index ["announcement_manager_id"], name: "index_announcements_on_announcement_manager_id"
  end

  create_table "course_registrations", force: :cascade do |t|
    t.string "status"
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "grade"
    t.index ["course_id"], name: "index_course_registrations_on_course_id"
    t.index ["user_id"], name: "index_course_registrations_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.string "course_code"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "semester_id"
    t.integer "teacher_id"
    t.integer "department_id"
    t.integer "announcement_manager_id"
    t.index ["announcement_manager_id"], name: "index_courses_on_announcement_manager_id"
    t.index ["department_id"], name: "index_courses_on_department_id"
    t.index ["semester_id"], name: "index_courses_on_semester_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "deliverables", force: :cascade do |t|
    t.integer "weight", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "course_id"
    t.string "title"
    t.string "type"
    t.string "instructions"
    t.index ["course_id"], name: "index_deliverables_on_course_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "email_notifications", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "student_id"
    t.integer "course_id"
    t.integer "user_id"
    t.string "message"
    t.string "type"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "hyperlink"
    t.integer "course_id"
    t.string "title"
    t.string "description"
    t.index ["course_id"], name: "index_resources_on_course_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.date "registration_deadline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["name"], name: "index_semesters_on_name"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer "deliverable_id"
    t.integer "user_id", null: false
    t.string "hyperlink"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "grade"
    t.string "comment"
    t.index ["deliverable_id"], name: "index_submissions_on_deliverable_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "student_id"
    t.integer "announcement_manager_id"
  end

  create_table "text_notifications", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_registrations", force: :cascade do |t|
    t.string "status"
    t.string "user_type"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_registrations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "email"
    t.string "type"
    t.string "gender"
    t.integer "age"
  end

  create_table "web_notifications", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "course_registrations", "courses"
  add_foreign_key "submissions", "deliverables"
  add_foreign_key "submissions", "users"
  add_foreign_key "user_registrations", "users"
end
