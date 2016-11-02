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

ActiveRecord::Schema.define(version: 20161102032947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "congressmen", force: :cascade do |t|
    t.string   "name"
    t.string   "congressperson_id"
    t.string   "state"
    t.string   "party"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "congressman_id"
    t.string   "supplier"
    t.string   "cnpj_cpf"
    t.string   "document_id"
    t.datetime "issue_date"
    t.decimal  "document_value"
    t.decimal  "remark_value"
    t.decimal  "net_value"
    t.string   "month"
    t.string   "year"
    t.string   "applicant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["congressman_id"], name: "index_expenses_on_congressman_id", using: :btree
  end

  add_foreign_key "expenses", "congressmen"
end
