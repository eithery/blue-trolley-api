# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_07_233258) do

  create_table "crews", force: :cascade do |t|
    t.string "name", null: false
    t.string "native_name", null: false
    t.boolean "active", default: true, null: false
    t.string "location"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_crews_on_name", unique: true
    t.index ["native_name"], name: "index_crews_on_native_name", unique: true
  end

  create_table "participants", force: :cascade do |t|
    t.integer "user_account_id", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "middle_name"
    t.integer "gender"
    t.integer "age_category", default: 0, null: false
    t.integer "age"
    t.date "born_on"
    t.boolean "primary"
    t.string "home_phone"
    t.string "cell_phone"
    t.string "email"
    t.text "address"
    t.string "ticket_code"
    t.boolean "flagged", default: false, null: false
    t.text "notes"
    t.datetime "approved_at"
    t.string "approved_by"
    t.datetime "registered_at"
    t.string "registered_by"
    t.integer "payment_type"
    t.datetime "payment_sent_at"
    t.string "payment_sent_by"
    t.string "payment_notes"
    t.datetime "payment_received_at"
    t.string "payment_received_by"
    t.datetime "payment_confirmed_at"
    t.string "payment_confirmed_by"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_code"], name: "index_participants_on_ticket_code", unique: true
    t.index ["user_account_id"], name: "index_participants_on_user_account_id"
  end

  create_table "user_accounts", force: :cascade do |t|
    t.integer "crew_id"
    t.string "login", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "crew_lead", default: false, null: false
    t.boolean "financier", default: false, null: false
    t.boolean "gatekeeper", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "dev", default: false, null: false
    t.string "remember_token", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_expired_at"
    t.boolean "active", default: false, null: false
    t.string "activation_token"
    t.string "activation_code"
    t.datetime "activated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activation_token"], name: "index_user_accounts_on_activation_token"
    t.index ["crew_id"], name: "index_user_accounts_on_crew_id"
    t.index ["email"], name: "index_user_accounts_on_email", unique: true
    t.index ["login"], name: "index_user_accounts_on_login", unique: true
    t.index ["remember_token"], name: "index_user_accounts_on_remember_token", unique: true
    t.index ["reset_password_token"], name: "index_user_accounts_on_reset_password_token"
  end

end
