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

ActiveRecord::Schema.define(version: 20160716230731) do

  create_table "admins", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "password_digest", limit: 255
    t.boolean  "is_active",                   default: true
  end

  create_table "codigos", force: :cascade do |t|
    t.string   "codigo",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "grupoquizzs", force: :cascade do |t|
    t.datetime "Hora"
    t.integer  "quizz_id",   limit: 4
    t.integer  "grupo_id",   limit: 4
    t.string   "codigo_id",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "iniciado"
  end

  create_table "grupos", force: :cascade do |t|
    t.string   "Nombre_grupo", limit: 255
    t.string   "Maestro",      limit: 255
    t.integer  "temarioid",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pregunta_quizzs", force: :cascade do |t|
    t.integer "quizz_id",    limit: 4
    t.integer "pregunta_id", limit: 4
  end

  create_table "preguntas", force: :cascade do |t|
    t.text     "texto",      limit: 65535
    t.text     "respuesta1", limit: 65535
    t.text     "respuesta2", limit: 65535
    t.text     "respuesta3", limit: 65535
    t.text     "respuesta4", limit: 65535
    t.integer  "tiempo",     limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "image",      limit: 255
    t.boolean  "is_active",                default: true
    t.integer  "temaid",     limit: 4
  end

  create_table "puntajes", force: :cascade do |t|
    t.string   "codigo",     limit: 255
    t.string   "alumno",     limit: 255
    t.string   "string",     limit: 255
    t.float    "puntaje",    limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "quizzs", force: :cascade do |t|
    t.integer  "pregunta",   limit: 4
    t.boolean  "disponible"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "nombre",     limit: 255
    t.integer  "temaid",     limit: 4
    t.boolean  "is_active",              default: true
  end

  create_table "resultados", force: :cascade do |t|
    t.string   "Codigo",     limit: 255
    t.string   "Alumno",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "respuesta",  limit: 4
    t.integer  "pregunta",   limit: 4
  end

  create_table "temarios", force: :cascade do |t|
    t.text     "temas",         limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "nombretemario", limit: 255
    t.text     "descripcion",   limit: 65535
    t.boolean  "is_active",                   default: true
  end

  create_table "temas", force: :cascade do |t|
    t.text     "nombretema",  limit: 65535
    t.integer  "quizz",       limit: 4
    t.integer  "temarioid",   limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "descripcion", limit: 65535
    t.boolean  "is_active",                 default: true
  end

  add_index "temas", ["nombretema"], name: "index_temas_on_nombretema", unique: true, length: {"nombretema"=>767}, using: :btree

end
