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

ActiveRecord::Schema.define(version: 2020_07_07_195415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "beds", force: :cascade do |t|
    t.string "area"
    t.integer "quantity"
    t.integer "branch_id", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.geometry "georeference", limit: {:srid=>0, :type=>"geometry"}
    t.string "town"
    t.integer "provider_id", null: false
    t.integer "state_id"
    t.string "slug"
    t.index ["provider_id"], name: "index_branches_on_provider_id"
    t.index ["state_id"], name: "index_branches_on_state_id"
  end

  create_table "costs", force: :cascade do |t|
    t.string "name"
    t.decimal "amount", precision: 10, scale: 2
    t.integer "provider_id", null: false
    t.index ["provider_id"], name: "index_costs_on_provider_id"
  end

  create_table "medical_assistences", force: :cascade do |t|
    t.string "name"
    t.decimal "percentage", precision: 5, scale: 4
    t.integer "provider_id", null: false
    t.index ["provider_id"], name: "index_medical_assistences_on_provider_id"
  end

  create_table "provider_maximums", force: :cascade do |t|
    t.decimal "tickets"
    t.decimal "waiting_time"
    t.integer "affiliates"
    t.decimal "personnel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "subnet"
    t.string "abbreviation"
    t.string "website"
    t.string "email"
    t.integer "affiliations"
    t.integer "financed_affiliations"
    t.text "communication_services"
    t.integer "logo_url"
    t.boolean "is_private"
    t.boolean "show"
    t.boolean "featured"
    t.integer "state_id"
    t.index ["name"], name: "index_providers_on_name"
    t.index ["state_id"], name: "index_providers_on_state_id"
  end

  create_table "providers_old", force: :cascade do |t|
    t.string "nombre_abreviado"
    t.string "nombre_completo"
    t.string "web"
    t.integer "afiliados_fonasa"
    t.integer "afiliados"
    t.text "comunicacion"
    t.decimal "captacion_rn", precision: 9, scale: 2
    t.decimal "control_desarrollo", precision: 9, scale: 2
    t.decimal "control_embarazo", precision: 9, scale: 2
    t.decimal "control_hiv_vdrl", precision: 9, scale: 2
    t.decimal "control_pauta_45_64", precision: 9, scale: 2
    t.decimal "indice_cesareas"
    t.decimal "ticket_de_medicamentos_general_fonasa", precision: 9, scale: 2
    t.decimal "ticket_de_medicamentos_general_no_fonasa", precision: 9, scale: 2
    t.decimal "ticket_de_medicamentos_topeados_fonasa", precision: 9, scale: 2
    t.decimal "ticket_de_medicamentos_topeados_no_fonasa", precision: 9, scale: 2
    t.decimal "consulta_medicina_general_fonasa", precision: 9, scale: 2
    t.decimal "consulta_medicina_general_no_fonasa", precision: 9, scale: 2
    t.decimal "consulta_pediatria_fonasa", precision: 9, scale: 2
    t.decimal "consulta_pediatria_no_fonasa", precision: 9, scale: 2
    t.decimal "consulta_control_de_embarazo_fonasa", precision: 9, scale: 2
    t.decimal "consulta_control_de_embarazo_no_fonasa", precision: 9, scale: 2
    t.decimal "consulta_ginecologia_fonasa", precision: 9, scale: 2
    t.decimal "consulta_ginecologia_no_fonasa", precision: 9, scale: 2
    t.decimal "consulta_otras_especialidades_fonasa", precision: 9, scale: 2
    t.decimal "consulta_otras_especialidades_no_fonasa", precision: 9, scale: 2
    t.decimal "consulta_urgencia_centralizada_fonasa", precision: 9, scale: 2
    t.decimal "consulta_urgencia_centralizada_no_fonasa", precision: 9, scale: 2
    t.decimal "consulta_no_urgencia_domicilio_fonasa", precision: 9, scale: 2
    t.decimal "consulta_no_urgencia_domicilio_no_fonasa", precision: 9, scale: 2
    t.decimal "consulta_urgencia_domicilio_fonasa", precision: 9, scale: 2
    t.decimal "consulta_urgencia_domicilio_no_fonasa", precision: 9, scale: 2
    t.decimal "consulta_odontologica_fonasa", precision: 9, scale: 2
    t.decimal "consulta_odontologica_no_fonasa", precision: 9, scale: 2
    t.decimal "consulta_medico_de_referencia_fonasa", precision: 9, scale: 2
    t.decimal "consulta_medico_de_referencia_no_fonasa", precision: 9, scale: 2
    t.decimal "endoscopia_digestiva_endoscopia_fonasa", precision: 9, scale: 2
    t.decimal "endoscopia_digestiva_endoscopia_no_fonasa", precision: 9, scale: 2
    t.decimal "ecografia_simple_fonasa", precision: 9, scale: 2
    t.decimal "ecografia_simple_no_fonasa", precision: 9, scale: 2
    t.decimal "ecodoppler_fonasa", precision: 9, scale: 2
    t.decimal "ecodoppler_no_fonasa", precision: 9, scale: 2
    t.decimal "rx_simple_fonasa", precision: 9, scale: 2
    t.decimal "rx_simple_no_fonasa", precision: 9, scale: 2
    t.decimal "rx_torax_fonasa", precision: 9, scale: 2
    t.decimal "rx_torax_no_fonasa", precision: 9, scale: 2
    t.decimal "rx_colorectal_fonasa", precision: 9, scale: 2
    t.decimal "rx_colorectal_no_fonasa", precision: 9, scale: 2
    t.decimal "resonancia_fonasa", precision: 9, scale: 2
    t.decimal "resonancia_no_fonasa", precision: 9, scale: 2
    t.decimal "tomografia_fonasa", precision: 9, scale: 2
    t.decimal "tomografia_no_fonasa", precision: 9, scale: 2
    t.decimal "laboratorio_rutina_basica_fonasa", precision: 9, scale: 2
    t.decimal "laboratorio_rutina_basica_no_fonasa", precision: 9, scale: 2
    t.decimal "tiempo_espera_medicina_general", precision: 9, scale: 2
    t.decimal "tiempo_espera_pediatria", precision: 9, scale: 2
    t.decimal "tiempo_espera_cirugia_general", precision: 9, scale: 2
    t.decimal "tiempo_espera_ginecotocologia", precision: 9, scale: 2
    t.decimal "tiempo_espera_cardiologia", precision: 9, scale: 2
    t.decimal "conformidad_disponibilidad_agenda_2014", precision: 9, scale: 2
    t.decimal "conformidad_disponibilidad_agenda_2010", precision: 9, scale: 2
    t.decimal "evaluacion_tiempo_espera_sala_2014", precision: 9, scale: 2
    t.decimal "evaluacion_tiempo_espera_sala_2010", precision: 9, scale: 2
    t.decimal "facilidad_para_realizar_tramites_gestiones_2014", precision: 9, scale: 2
    t.decimal "facilidad_para_realizar_tramites_gestiones_2010", precision: 9, scale: 2
    t.decimal "disponibilidad_medicamentos_farmacia_2014", precision: 9, scale: 2
    t.decimal "disponibilidad_medicamentos_farmacia_2010", precision: 9, scale: 2
    t.decimal "informacion_sobre_derechos_2014", precision: 9, scale: 2
    t.decimal "informacion_sobre_derechos_2010", precision: 9, scale: 2
    t.decimal "queja_sugerencia_sabe_donde_dirigirse_2014", precision: 9, scale: 2
    t.decimal "queja_sugerencia_sabe_donde_dirigirse_2010", precision: 9, scale: 2
    t.decimal "satisfaccion_primer_nivel_atencion_2014", precision: 9, scale: 2
    t.decimal "satisfaccion_primer_nivel_atencion_2010", precision: 9, scale: 2
    t.decimal "satisfaccion_internacion_hospitalaria_2012", precision: 9, scale: 2
    t.decimal "medicos_generales_policlinica", precision: 9, scale: 2
    t.decimal "medicos_de_familia_policlinica", precision: 9, scale: 2
    t.decimal "medicos_pediatras_policlinica", precision: 9, scale: 2
    t.decimal "medicos_ginecologos_policlinica", precision: 9, scale: 2
    t.decimal "auxiliares_enfermeria_policlinica", precision: 9, scale: 2
    t.decimal "licenciadas_enfermeria_policlinica", precision: 9, scale: 2
    t.decimal "cantidad_cad", precision: 9, scale: 2
    t.decimal "medicina_general_cantidad_cad", precision: 9, scale: 2
    t.decimal "medicina_familiar_cantidad_cad", precision: 9, scale: 2
    t.decimal "pediatria_cantidad_cad", precision: 9, scale: 2
    t.decimal "ginecotologia_cantidad_cad", precision: 9, scale: 2
    t.decimal "medicina_interna_cantidad_cad", precision: 9, scale: 2
    t.decimal "medicina_intensiva_adultos_cantidad_cad", precision: 9, scale: 2
    t.decimal "medicina_intensiva_pediatrica_cantidad_cad", precision: 9, scale: 2
    t.decimal "neonatologia_cantidad_cad", precision: 9, scale: 2
    t.decimal "cantidad_cad_psiquiatria_adultos", precision: 9, scale: 2
    t.decimal "cantidad_cad_psiquiatria_pediatrica", precision: 9, scale: 2
    t.decimal "especialidades_medicas_cantidad_cad", precision: 9, scale: 2
    t.decimal "cirugia_general_cantidad_cad", precision: 9, scale: 2
    t.decimal "medicina_emergencia_cantidad_cad", precision: 9, scale: 2
    t.string "reserva_presencial"
    t.string "reserva_telefonica"
    t.string "reserva_web"
    t.string "reserva_consulta_medica"
    t.string "realiza_recordatorio_cita"
    t.string "realiza_caida_reserva_sin_confirmacion"
    t.string "comunicacion_usuario_suspension_modificacion"
    t.boolean "private_insurance", default: false
    t.integer "estructura_primaria", default: 0
    t.integer "estructura_secundaria", default: 0
    t.integer "estructura_ambulatorio", default: 0
    t.integer "estructura_urgencia", default: 0
    t.string "logo"
    t.string "search_name"
    t.string "vias_asignacion_citas"
  end

  create_table "satisfactions", force: :cascade do |t|
    t.string "name"
    t.decimal "percentage", precision: 5, scale: 4
    t.integer "provider_id", null: false
    t.index ["provider_id"], name: "index_satisfactions_on_provider_id"
  end

  create_table "sites", force: :cascade do |t|
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "direccion"
    t.string "departamento"
    t.string "localidad"
    t.string "nivel"
    t.boolean "servicio_de_urgencia"
    t.boolean "alergista"
    t.boolean "anestesiologia"
    t.boolean "cardiologia"
    t.boolean "cirugia"
    t.boolean "cirugia_reparadora"
    t.boolean "cirugia_vascular"
    t.boolean "deportologia"
    t.boolean "dermatologia"
    t.boolean "endocrinolgia"
    t.boolean "fisiatria"
    t.boolean "gastroenterologia"
    t.boolean "geriatria"
    t.boolean "ginecologia"
    t.boolean "hematologia"
    t.boolean "infectologia"
    t.boolean "medicina_general"
    t.boolean "medicina_interna"
    t.boolean "medicina_intensiva"
    t.boolean "nefrologia"
    t.boolean "neonatologia"
    t.boolean "neumologia"
    t.boolean "neurocirugia"
    t.boolean "neurologia"
    t.boolean "neuropediatria"
    t.boolean "odontologia"
    t.boolean "oncologia"
    t.boolean "otorrinolaringologia"
    t.boolean "pediatria"
    t.boolean "psiquiatria"
    t.boolean "psiquiatria_infantil"
    t.boolean "reumatologia"
    t.boolean "traumatologia"
    t.boolean "urologia"
    t.bigint "state_id"
    t.index ["provider_id"], name: "index_sites_on_provider_id"
    t.index ["state_id"], name: "index_sites_on_state_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.decimal "professionals_count"
    t.integer "branch_id", null: false
    t.index ["branch_id"], name: "index_specialities_on_branch_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string "client_id"
    t.integer "branch_id"
    t.integer "step_id"
    t.string "question_value"
    t.integer "answer_id"
    t.json "answer_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question_type"
    t.string "question_subtype"
    t.index ["answer_id"], name: "index_surveys_on_answer_id"
    t.index ["branch_id"], name: "index_surveys_on_branch_id"
    t.index ["client_id"], name: "index_surveys_on_client_id"
    t.index ["step_id"], name: "index_surveys_on_step_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context"
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "waiting_times", force: :cascade do |t|
    t.string "name"
    t.decimal "days", precision: 6, scale: 3
    t.integer "provider_id", null: false
    t.index ["provider_id"], name: "index_waiting_times_on_provider_id"
  end

  add_foreign_key "sites", "providers_old", column: "provider_id"
end
