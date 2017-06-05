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

ActiveRecord::Schema.define(version: 20170605112827) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "weight",           default: 0
    t.integer  "products_counter", default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "total",            default: 0
    t.integer  "user_id"
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "shipping_name"
    t.string   "shipping_address"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "token"
    t.boolean  "is_paid",          default: false
    t.string   "payment_method"
    t.string   "aasm_state",       default: "order_placed"
    t.index ["aasm_state"], name: "index_orders_on_aasm_state"
  end

  create_table "product_lists", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "product_name"
    t.integer  "product_price"
    t.integer  "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       precision: 10, scale: 2
    t.integer  "quantity"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "image"
    t.string   "content"
    t.string   "category"
    t.string   "location"
    t.string   "remark"
    t.string   "position"
    t.string   "img_url"
    t.string   "category1"
    t.string   "category2"
    t.string   "keyword"
    t.string   "img1_url"
    t.string   "img2_url"
    t.string   "img3_url"
    t.string   "img4_url"
    t.string   "img5_url"
    t.string   "price_unit"
    t.integer  "category_id"
    t.string   "status",                               default: "none"
    t.string   "number"
    t.decimal  "msrp",        precision: 10, scale: 2
    t.string   "category3"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["name"], name: "index_products_on_name"
    t.index ["number"], name: "index_products_on_number", unique: true
    t.index ["status", "category_id"], name: "index_products_on_status_and_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.string   "name"
    t.boolean  "is_supplier",            default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
