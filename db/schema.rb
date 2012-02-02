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

ActiveRecord::Schema.define(:version => 20120201035926) do

  create_table "asesoria", :force => true do |t|
    t.string   "necesidad_1"
    t.string   "necesidad_2"
    t.string   "paciente_nombre"
    t.integer  "paciente_edad"
    t.string   "terapia_para"
    t.string   "terapia_tipo"
    t.string   "paciente_telefono"
    t.string   "paciente_email"
    t.string   "paciente_region"
    t.string   "paciente_comuna"
    t.string   "dia_preferencia"
    t.datetime "fecha_desde_est"
    t.datetime "fecha_hasta_est"
    t.string   "rango_horario"
    t.string   "terapeuta_sexo"
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

  create_table "terapeuta", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "region"
    t.string   "comuna"
    t.integer  "ptelefono"
    t.integer  "telefono"
    t.integer  "pmovil"
    t.integer  "movil"
    t.string   "email"
    t.string   "tipo"
    t.string   "especialidad"
    t.string   "password_hash"
    t.string   "plan"
    t.datetime "last_logged_in"
    t.string   "reset"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagen_url"
  end

  create_table "terapia", :force => true do |t|
    t.string   "nombre_corto"
    t.string   "nombre_largo"
    t.string   "descripcion"
    t.string   "imagen_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terapias", :force => true do |t|
    t.string   "nombre_corto"
    t.string   "descripcion_corta"
    t.string   "descripcion"
    t.string   "categoria"
    t.string   "caracteristica"
    t.string   "imagen_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
