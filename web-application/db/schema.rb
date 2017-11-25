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

ActiveRecord::Schema.define(version: 20171124071505) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "hours", precision: 10
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bills_id"
    t.index ["bills_id"], name: "index_activities_on_bills_id"
    t.index ["client_id"], name: "index_activities_on_client_id"
  end

  create_table "bills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "import", precision: 10
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "prices_id"
    t.string "invoice_file_name"
    t.string "invoice_content_type"
    t.integer "invoice_file_size"
    t.datetime "invoice_updated_at"
    t.index ["client_id"], name: "index_bills_on_client_id"
    t.index ["prices_id"], name: "index_bills_on_prices_id"
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type"
    t.string "act_primary"
    t.string "act_secondary"
    t.string "name"
    t.string "surname"
    t.string "address"
    t.string "cap"
    t.string "city"
    t.string "country"
    t.string "ssn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "template_file_name"
    t.string "template_content_type"
    t.integer "template_file_size"
    t.datetime "template_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "import", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "clients"
  add_foreign_key "bills", "clients"
end
