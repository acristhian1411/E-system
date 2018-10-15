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

ActiveRecord::Schema.define(version: 2018_10_15_015547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "barrios", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_descrip"
    t.boolean "category_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ciudades", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "n_cedula"
    t.string "cli_telefono"
    t.integer "limite_credito"
    t.boolean "activo"
    t.bigint "ciudade_id"
    t.bigint "barrio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barrio_id"], name: "index_clientes_on_barrio_id"
    t.index ["ciudade_id"], name: "index_clientes_on_ciudade_id"
  end

  create_table "marcas", force: :cascade do |t|
    t.string "marca_descrip"
    t.boolean "marca_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "razon_social"
    t.string "ruc"
    t.string "prov_direccion"
    t.string "telefono"
    t.string "email"
    t.boolean "prov_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "subcat_descrip"
    t.boolean "subcat_active"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "sucursals", force: :cascade do |t|
    t.string "suc_descrip"
    t.boolean "suc_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clientes", "barrios"
  add_foreign_key "clientes", "ciudades"
  add_foreign_key "sub_categories", "categories"
end
