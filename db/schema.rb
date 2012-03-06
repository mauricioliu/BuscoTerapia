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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120306004011) do

  create_table "articulos", :force => true do |t|
    t.string   "titulo"
    t.string   "autor"
    t.string   "especialidad"
    t.text     "contenido",    :limit => 2147483647
    t.string   "tipo"
    t.string   "imagen_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asesorias", :force => true do |t|
    t.text     "necesidad_1",       :limit => 16777215
    t.text     "necesidad_2",       :limit => 16777215
    t.string   "paciente_nombre"
    t.integer  "paciente_edad"
    t.string   "terapia_para"
    t.string   "terapia_tipo"
    t.string   "paciente_telefono"
    t.string   "paciente_email"
    t.datetime "hora_desde"
    t.datetime "hora_hasta"
    t.string   "terapeuta_otro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comunas", :force => true do |t|
    t.integer  "region_id"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dias_atencion", :force => true do |t|
    t.integer  "asesoria_id"
    t.string   "dia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "especialidades", :force => true do |t|
    t.integer  "terapeuta_id"
    t.string   "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estudios", :force => true do |t|
    t.integer  "terapeuta_id"
    t.string   "titulo"
    t.string   "establecimiento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forma_pagos", :force => true do |t|
    t.integer  "terapeuta_id"
    t.string   "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pagos", :force => true do |t|
    t.integer  "terapeuta_id"
    t.string   "tipo"
    t.integer  "monto"
    t.string   "estado"
    t.datetime "fecha_pago"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_data", :force => true do |t|
    t.string   "nombre"
    t.string   "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regiones", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "terapeutas", :force => true do |t|
    t.string   "nombre"
    t.string   "rut"
    t.string   "direccion"
    t.string   "region"
    t.string   "comuna"
    t.string   "codigo_postal"
    t.string   "sitio_web"
    t.integer  "ptelefono"
    t.integer  "telefono"
    t.integer  "movil"
    t.string   "email"
    t.string   "plan_tipo"
    t.datetime "plan_expira"
    t.string   "plan_ciclo"
    t.string   "arancel"
    t.string   "descuentos"
    t.string   "convenios"
    t.string   "password_hash"
    t.datetime "last_logged_in"
    t.string   "reset"
    t.string   "estado"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagen_url"
  end

  create_table "terapias", :force => true do |t|
    t.string   "nombre_corto"
    t.string   "descripcion_corta"
    t.text     "descripcion",       :limit => 2147483647
    t.string   "categoria"
    t.string   "caracteristica"
    t.string   "imagen_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_terapias", :force => true do |t|
    t.integer  "terapeuta_id"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
