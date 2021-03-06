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

ActiveRecord::Schema.define(version: 2019_05_18_163523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.bigint "trait_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trait_id"], name: "index_answers_on_trait_id"
  end

  create_table "avatars", force: :cascade do |t|
    t.string "image_url"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_avatars_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "english_name"
    t.string "japanese_name"
    t.string "gender"
    t.string "alias"
    t.string "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "personality_id"
    t.index ["personality_id"], name: "index_characters_on_personality_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "user_a_id"
    t.integer "user_b_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "matcher_id"
    t.integer "matchee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "personalities", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trait_combinations", force: :cascade do |t|
    t.bigint "personality_id"
    t.bigint "trait_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personality_id"], name: "index_trait_combinations_on_personality_id"
    t.index ["trait_id"], name: "index_trait_combinations_on_trait_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "title"
    t.string "symbol"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "gender"
    t.string "preference"
    t.string "username"
    t.integer "age"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_users_on_character_id"
  end

  add_foreign_key "answers", "traits"
  add_foreign_key "avatars", "characters"
  add_foreign_key "characters", "personalities"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "trait_combinations", "personalities"
  add_foreign_key "trait_combinations", "traits"
  add_foreign_key "users", "characters"
end
