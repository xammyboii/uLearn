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

ActiveRecord::Schema[7.0].define(version: 2023_12_08_002948) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_title"
    t.string "description"
    t.decimal "price"
    t.integer "number_of_lectures"
    t.integer "difficulty_id", null: false
    t.integer "course_length"
    t.integer "category_id", null: false
    t.datetime "publish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_courses_on_category_id"
    t.index ["difficulty_id"], name: "index_courses_on_difficulty_id"
  end

  create_table "courses_in_orders", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "purchased_course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_courses_in_orders_on_order_id"
    t.index ["purchased_course_id"], name: "index_courses_in_orders_on_purchased_course_id"
  end

  create_table "customer_infos", force: :cascade do |t|
    t.string "customer_name"
    t.string "phone_number"
    t.string "address"
    t.integer "user_id", null: false
    t.integer "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_customer_infos_on_province_id"
    t.index ["user_id"], name: "index_customer_infos_on_user_id"
  end

  create_table "difficulties", force: :cascade do |t|
    t.string "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_info_id", null: false
    t.string "stripe_session_id"
    t.date "order_date"
    t.decimal "price"
    t.decimal "GST"
    t.decimal "HST"
    t.decimal "PST"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_info_id"], name: "index_orders_on_customer_info_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "Province_Name"
    t.decimal "GST"
    t.decimal "HST"
    t.decimal "PST"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchased_courses", force: :cascade do |t|
    t.string "course_title"
    t.string "description"
    t.decimal "price"
    t.integer "number_of_lectures"
    t.integer "difficulty_id", null: false
    t.integer "course_length"
    t.integer "category_id", null: false
    t.date "publish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "users_id"
    t.index ["category_id"], name: "index_purchased_courses_on_category_id"
    t.index ["difficulty_id"], name: "index_purchased_courses_on_difficulty_id"
    t.index ["users_id"], name: "index_purchased_courses_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "categories"
  add_foreign_key "courses", "difficulties"
  add_foreign_key "courses_in_orders", "orders"
  add_foreign_key "courses_in_orders", "purchased_courses"
  add_foreign_key "customer_infos", "provinces"
  add_foreign_key "customer_infos", "users"
  add_foreign_key "orders", "customer_infos"
  add_foreign_key "purchased_courses", "categories"
  add_foreign_key "purchased_courses", "difficulties"
end
