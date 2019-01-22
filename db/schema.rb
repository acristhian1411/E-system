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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_01_13_140129) do
=======
ActiveRecord::Schema.define(version: 2019_01_22_161131) do
>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14

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

  create_table "active_admin_managed_resources", force: :cascade do |t|
    t.string "class_name", null: false
    t.string "action", null: false
    t.string "name"
    t.index ["class_name", "action", "name"], name: "active_admin_managed_resources_index", unique: true
  end

  create_table "active_admin_permissions", force: :cascade do |t|
    t.integer "managed_resource_id", null: false
    t.integer "role", limit: 2, default: 0, null: false
    t.integer "state", limit: 2, default: 0, null: false
    t.index ["managed_resource_id", "role"], name: "active_admin_permissions_index", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", limit: 2, default: 0, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "barrios", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
=======
  create_table "cajas", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14
  create_table "categories", force: :cascade do |t|
    t.string "category_descrip"
    t.boolean "category_active", default: true
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
    t.string "direccion"
    t.index ["barrio_id"], name: "index_clientes_on_barrio_id"
    t.index ["ciudade_id"], name: "index_clientes_on_ciudade_id"
  end

  create_table "compra_detalles", force: :cascade do |t|
    t.bigint "producto_id"
    t.integer "cantidad"
    t.float "precio_compra"
    t.integer "descuento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "compra_id"
    t.float "porcent_desc"
    t.index ["compra_id"], name: "index_compra_detalles_on_compra_id"
    t.index ["producto_id"], name: "index_compra_detalles_on_producto_id"
  end

  create_table "compras", force: :cascade do |t|
    t.bigint "provider_id"
    t.bigint "admin_user_id"
    t.date "fecha_compra"
    t.string "num_factura"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "activo"
    t.index ["admin_user_id"], name: "index_compras_on_admin_user_id"
    t.index ["provider_id"], name: "index_compras_on_provider_id"
  end

<<<<<<< HEAD
=======
  create_table "credito_clientes", force: :cascade do |t|
    t.bigint "cliente_id"
    t.bigint "venta_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_credito_clientes_on_cliente_id"
    t.index ["venta_id"], name: "index_credito_clientes_on_venta_id"
  end

  create_table "cuota_clientes", force: :cascade do |t|
    t.bigint "credito_cliente_id"
    t.integer "cantidad_cuota"
    t.float "monto_cuota"
    t.date "vencimiento"
    t.float "intereses"
    t.float "monto_pagado"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credito_cliente_id"], name: "index_cuota_clientes_on_credito_cliente_id"
  end

>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14
  create_table "marcas", force: :cascade do |t|
    t.string "marca_descrip"
    t.boolean "marca_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.bigint "provider_id"
    t.bigint "category_id"
    t.bigint "sub_category_id"
    t.bigint "marca_id"
    t.string "prod_descrip"
    t.integer "iva"
    t.float "precio_venta"
    t.boolean "prod_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_productos_on_category_id"
    t.index ["marca_id"], name: "index_productos_on_marca_id"
    t.index ["provider_id"], name: "index_productos_on_provider_id"
    t.index ["sub_category_id"], name: "index_productos_on_sub_category_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "razon_social"
    t.string "ruc"
    t.string "prov_direccion"
    t.string "telefono"
    t.string "email"
    t.boolean "prov_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "producto_id"
    t.bigint "sucursal_id"
    t.integer "cantidad"
    t.integer "cant_minima"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id", "sucursal_id"], name: "index_unique", unique: true
    t.index ["producto_id"], name: "index_stocks_on_producto_id"
    t.index ["sucursal_id"], name: "index_stocks_on_sucursal_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "subcat_descrip"
    t.boolean "subcat_active", default: true
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "sucursals", force: :cascade do |t|
    t.string "suc_descrip"
    t.boolean "suc_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "direccion"
    t.string "encargado"
    t.string "telefono"
  end

<<<<<<< HEAD
=======
  create_table "tipo_mov_cajas", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14
  create_table "traslado_detalles", force: :cascade do |t|
    t.bigint "producto_id"
    t.bigint "traslado_id"
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_traslado_detalles_on_producto_id"
    t.index ["traslado_id"], name: "index_traslado_detalles_on_traslado_id"
  end

  create_table "traslados", force: :cascade do |t|
    t.integer "sucursal_origen"
    t.integer "sucursal_destino"
    t.date "fecha"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "motivo"
<<<<<<< HEAD
    t.integer "num_comprobante"
=======
    t.integer "num_comprobante", null: false
    t.boolean "activo"
>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14
    t.index ["admin_user_id"], name: "index_traslados_on_admin_user_id"
  end

  create_table "venta", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.bigint "sucursal_id"
    t.bigint "cliente_id"
    t.date "fecha"
    t.integer "num_factura"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "activo"
<<<<<<< HEAD
=======
    t.string "forma_pago"
>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14
    t.index ["admin_user_id"], name: "index_venta_on_admin_user_id"
    t.index ["cliente_id"], name: "index_venta_on_cliente_id"
    t.index ["sucursal_id"], name: "index_venta_on_sucursal_id"
  end

  create_table "venta_detalles", force: :cascade do |t|
    t.bigint "venta_id"
    t.bigint "producto_id"
    t.integer "cantidad"
    t.float "monto_desc"
    t.float "porcent_desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "precio_venta"
    t.index ["producto_id"], name: "index_venta_detalles_on_producto_id"
    t.index ["venta_id"], name: "index_venta_detalles_on_venta_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.text "object_changes"
    t.text "additional_objects"
    t.text "additional_objects_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "clientes", "barrios"
  add_foreign_key "clientes", "ciudades"
  add_foreign_key "compra_detalles", "compras"
  add_foreign_key "compra_detalles", "productos"
  add_foreign_key "compras", "admin_users"
  add_foreign_key "compras", "providers"
<<<<<<< HEAD
=======
  add_foreign_key "credito_clientes", "clientes"
  add_foreign_key "credito_clientes", "venta", column: "venta_id"
  add_foreign_key "cuota_clientes", "credito_clientes"
>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14
  add_foreign_key "productos", "categories"
  add_foreign_key "productos", "marcas"
  add_foreign_key "productos", "providers"
  add_foreign_key "productos", "sub_categories"
  add_foreign_key "stocks", "productos"
  add_foreign_key "stocks", "sucursals"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "traslado_detalles", "productos"
  add_foreign_key "traslado_detalles", "traslados"
  add_foreign_key "traslados", "admin_users"
  add_foreign_key "venta", "admin_users"
  add_foreign_key "venta", "clientes"
  add_foreign_key "venta", "sucursals"
  add_foreign_key "venta_detalles", "productos"
  add_foreign_key "venta_detalles", "venta", column: "venta_id"
end
