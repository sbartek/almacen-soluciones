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

ActiveRecord::Schema.define(version: 20140918093416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "familias", force: true do |t|
    t.string   "nombre"
    t.integer  "negocio_unidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "familias", ["negocio_unidad_id"], name: "index_familias_on_negocio_unidad_id", using: :btree

  create_table "fichas", force: true do |t|
    t.string   "nombre"
    t.string   "codigo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "importancia"
  end

  create_table "fichas_subfamilias", id: false, force: true do |t|
    t.integer "ficha_id",      null: false
    t.integer "subfamilia_id", null: false
  end

  create_table "materials", force: true do |t|
    t.integer  "cantidad"
    t.integer  "ficha_id"
    t.integer  "ubicacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["ficha_id"], name: "index_materials_on_ficha_id", using: :btree
  add_index "materials", ["ubicacion_id"], name: "index_materials_on_ubicacion_id", using: :btree

  create_table "negocio_unidads", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subfamilias", force: true do |t|
    t.string   "nombre"
    t.integer  "familia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subfamilias", ["familia_id"], name: "index_subfamilias_on_familia_id", using: :btree

  create_table "ubicacions", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "ciudad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
