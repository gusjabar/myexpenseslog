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

ActiveRecord::Schema.define(version: 20170111021102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 200
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "expensives", force: :cascade do |t|
    t.decimal  "amount"
    t.text     "note"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "logdate"
    t.index ["category_id"], name: "index_expensives_on_category_id", using: :btree
    t.index ["subcategory_id"], name: "index_expensives_on_subcategory_id", using: :btree
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "Name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_subcategories_on_category_id", using: :btree
  end

  add_foreign_key "expensives", "categories"
  add_foreign_key "expensives", "subcategories"
  add_foreign_key "subcategories", "categories"
end
