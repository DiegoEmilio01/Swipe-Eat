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

ActiveRecord::Schema.define(version: 2020_06_26_233108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aceptados", id: false, force: :cascade do |t|
    t.integer "swiper_acepta_id", null: false
    t.integer "swiper_aceptado_id", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bloqueados", id: false, force: :cascade do |t|
    t.integer "swiper_bloquea_id", null: false
    t.integer "swiper_bloqueado_id", null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "fecha"
    t.float "valoracion"
    t.bigint "restaurante_id"
    t.bigint "swiper_id"
    t.index ["restaurante_id"], name: "index_comentarios_on_restaurante_id"
    t.index ["swiper_id"], name: "index_comentarios_on_swiper_id"
  end

  create_table "comunas", force: :cascade do |t|
    t.string "nombre"
    t.boolean "cuarentena"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorecidos", id: false, force: :cascade do |t|
    t.bigint "swiper_id"
    t.bigint "restaurante_id"
    t.index ["restaurante_id"], name: "index_favorecidos_on_restaurante_id"
    t.index ["swiper_id"], name: "index_favorecidos_on_swiper_id"
  end

  create_table "gustos", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gustos_swiper", id: false, force: :cascade do |t|
    t.bigint "swiper_id"
    t.bigint "gusto_id"
    t.index ["gusto_id"], name: "index_gustos_swiper_on_gusto_id"
    t.index ["swiper_id"], name: "index_gustos_swiper_on_swiper_id"
  end

  create_table "matchs", id: false, force: :cascade do |t|
    t.integer "swiper_match_id", null: false
    t.integer "swiper_matched_id", null: false
  end

  create_table "meets", force: :cascade do |t|
    t.integer "swiper_cita_id", null: false
    t.integer "swiper_citado_id", null: false
    t.boolean "estado"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurante_id"
    t.boolean "hidden"
    t.index ["restaurante_id"], name: "index_meets_on_restaurante_id"
  end

  create_table "mensajes", force: :cascade do |t|
    t.integer "swiper_origen_id", null: false
    t.integer "swiper_destino_id", null: false
    t.string "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owner_reportes", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "comentario_id"
    t.string "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comentario_id"], name: "index_owner_reportes_on_comentario_id"
    t.index ["owner_id"], name: "index_owner_reportes_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  create_table "reportes", force: :cascade do |t|
    t.integer "swiper_reporta_id", null: false
    t.integer "swiper_reportado_id", null: false
    t.string "contenido"
    t.index ["swiper_reporta_id"], name: "index_reportes_on_swiper_reporta_id"
    t.index ["swiper_reportado_id"], name: "index_reportes_on_swiper_reportado_id"
  end

  create_table "restaurantes", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "comuna_id"
    t.string "aceptado", default: "Pendiente"
    t.bigint "owner_id"
    t.string "direccion"
    t.string "telefono"
    t.index ["comuna_id"], name: "index_restaurantes_on_comuna_id"
    t.index ["owner_id"], name: "index_restaurantes_on_owner_id"
  end

  create_table "swipers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.integer "edad"
    t.string "telefono"
    t.date "cumpleanos"
    t.string "direccion"
    t.string "descripcion"
    t.bigint "comuna_id"
    t.index ["comuna_id"], name: "index_swipers_on_comuna_id"
    t.index ["email"], name: "index_swipers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_swipers_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comentarios", "restaurantes"
  add_foreign_key "comentarios", "swipers"
  add_foreign_key "favorecidos", "restaurantes"
  add_foreign_key "favorecidos", "swipers"
  add_foreign_key "gustos_swiper", "gustos"
  add_foreign_key "gustos_swiper", "swipers"
  add_foreign_key "owner_reportes", "comentarios"
  add_foreign_key "owner_reportes", "owners"
  add_foreign_key "restaurantes", "comunas"
  add_foreign_key "swipers", "comunas"
end
