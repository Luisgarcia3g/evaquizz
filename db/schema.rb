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

ActiveRecord::Schema.define(version: 20160507065828) do

  create_table "pregunta", force: :cascade do |t|
    t.text     "texto",      limit: 65535
    t.text     "respuesta1", limit: 65535
    t.text     "respuesta2", limit: 65535
    t.text     "respuesta3", limit: 65535
    t.text     "respuesta4", limit: 65535
    t.integer  "tiempo",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "quizzs", force: :cascade do |t|
    t.integer  "pregunta",   limit: 4
    t.boolean  "disponible"
    t.text     "tema",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "temarios", force: :cascade do |t|
    t.text     "temas",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "temas", force: :cascade do |t|
    t.text     "nombretema", limit: 65535
    t.integer  "quizz",      limit: 4
    t.integer  "temario",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
