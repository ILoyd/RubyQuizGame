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

ActiveRecord::Schema[8.1].define(version: 2026_11_14_185022) do
  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "difficulties", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_difficulties_on_name", unique: true
  end

  create_table "questions", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "text", null: false
    t.string "answer1", null: false
    t.string "answer2", null: false
    t.string "answer3", null: false
    t.string "answer4", null: false
    t.integer "correct_answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.bigint "difficulty_id", null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
    t.index ["difficulty_id"], name: "index_questions_on_difficulty_id"
  end

  create_table "scores", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "remaining_tokens"
    t.string "categories", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "difficulty_id", null: false
    t.index ["difficulty_id"], name: "index_scores_on_difficulty_id"
  end

  add_foreign_key "questions", "categories"
  add_foreign_key "questions", "difficulties"
  add_foreign_key "scores", "difficulties"
end
