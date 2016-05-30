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

ActiveRecord::Schema.define(version: 20160530174605) do

  create_table "admins", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
  end

  create_table "pregunta", force: :cascade do |t|
    t.text     "texto",      limit: 65535
    t.text     "respuesta1", limit: 65535
    t.text     "respuesta2", limit: 65535
    t.text     "respuesta3", limit: 65535
    t.text     "respuesta4", limit: 65535
    t.integer  "tiempo",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image",      limit: 255
  end

  create_table "pregunta_quizzs", id: false, force: :cascade do |t|
    t.integer "Id_Pregunta", limit: 4, null: false
    t.integer "IdQuizz",     limit: 4, null: false
  end

  add_index "pregunta_quizzs", ["IdQuizz"], name: "IdQuizz", using: :btree

  create_table "quizzs", force: :cascade do |t|
    t.boolean  "disponible"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "nombre",     limit: 255
    t.integer  "temaid",     limit: 4
  end

  add_index "quizzs", ["temaid"], name: "temaid", using: :btree

  create_table "temarios", force: :cascade do |t|
    t.text     "temas",         limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "nombretemario", limit: 255
    t.text     "descripcion",   limit: 65535
  end

  create_table "temas", force: :cascade do |t|
    t.string   "nombretema",  limit: 255
    t.integer  "temarioid",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "descripcion", limit: 65535
  end

  add_index "temas", ["nombretema"], name: "index_temas_on_nombretema", unique: true, using: :btree
  add_index "temas", ["temarioid"], name: "temario", using: :btree

  add_foreign_key "temas", "temarios", column: "temarioid", name: "temas_ibfk_1", on_update: :cascade, on_delete: :cascade
end
