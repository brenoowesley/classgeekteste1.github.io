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

ActiveRecord::Schema.define(version: 2020_06_19_003139) do

  create_table "turmas", force: :cascade do |t|
    t.string "nome"
    t.datetime "inicio"
    t.datetime "fim"
    t.float "horas"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "exp"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "turmas_users", id: false, force: :cascade do |t|
    t.integer "turma_id", null: false
    t.integer "user_id", null: false
    t.index ["turma_id", "user_id"], name: "index_turmas_users_on_turma_id_and_user_id", unique: true
  end

  create_table "tweets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "conteudo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "user_attributes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "hp"
    t.integer "mana"
    t.integer "money"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "xp"
    t.index ["user_id"], name: "index_user_attributes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "tweets", "users"
  add_foreign_key "user_attributes", "users"
end
