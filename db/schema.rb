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

ActiveRecord::Schema.define(version: 20171205141657) do

  create_table "drugs", force: :cascade do |t|
    t.string "name"
    t.decimal "cost_price", precision: 10, scale: 2
    t.decimal "selling_price", precision: 10, scale: 2
    t.integer "stock_quantity"
    t.string "manufacturer"
    t.date "purchase_date"
    t.date "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "drug_id"
    t.string "customer_name"
    t.integer "quantity_bought"
    t.string "dosage"
    t.decimal "total_price", precision: 10, scale: 2
    t.date "transaction_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id"], name: "index_sales_on_drug_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "reg_id"
    t.string "full_name"
    t.string "username"
    t.string "sex"
    t.string "password_digest"
    t.text "address"
    t.string "phone_number"
    t.string "email"
    t.date "date_employed"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
