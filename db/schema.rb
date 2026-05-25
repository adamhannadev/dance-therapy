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

ActiveRecord::Schema[7.2].define(version: 2026_05_25_044750) do
  create_table "elements", force: :cascade do |t|
    t.integer "figure_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["figure_id"], name: "index_elements_on_figure_id"
  end

  create_table "figures", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer "figure_id", null: false
    t.integer "element_id", null: false
    t.integer "step_number"
    t.string "foot_position"
    t.string "details"
    t.string "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_id"], name: "index_steps_on_element_id"
    t.index ["figure_id"], name: "index_steps_on_figure_id"
  end

  add_foreign_key "elements", "figures"
  add_foreign_key "steps", "elements"
  add_foreign_key "steps", "figures"
end
