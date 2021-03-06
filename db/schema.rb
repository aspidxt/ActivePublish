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

ActiveRecord::Schema.define(version: 20170714225520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_users", force: :cascade do |t|
    t.string "nickname"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.inet "session_ip"
    t.index ["user_id"], name: "index_chat_users_on_user_id"
  end

  create_table "chatroom_members", force: :cascade do |t|
    t.bigint "chatroom_id"
    t.bigint "chat_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_user_id"], name: "index_chatroom_members_on_chat_user_id"
    t.index ["chatroom_id"], name: "index_chatroom_members_on_chatroom_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "publication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_chatrooms_on_publication_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id"
    t.bigint "chat_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_user_id"], name: "index_messages_on_chat_user_id"
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_publications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "chat_users", "users"
  add_foreign_key "chatroom_members", "chat_users", on_delete: :cascade
  add_foreign_key "chatroom_members", "chatrooms", on_delete: :cascade
  add_foreign_key "chatrooms", "publications"
  add_foreign_key "messages", "chat_users", on_delete: :cascade
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "publications", "users"
end
