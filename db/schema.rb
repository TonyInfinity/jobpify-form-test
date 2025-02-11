# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20190228140243) do

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "job_type"
    t.string   "location"
    t.string   "job_author"
    t.boolean  "remote_ok"
    t.string   "apply_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "avatar"
    t.integer  "user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "stripe_id"
    t.string   "card_brand"
    t.string   "card_last4"
    t.string   "card_exp_month"
    t.string   "card_exp_year"
    t.datetime "expires_at"
    t.boolean  "admin"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
