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

ActiveRecord::Schema.define(version: 20160905134047) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "patient_id"
    t.datetime "start_time"
    t.integer  "place_id"
    t.integer  "visit_id"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_time"
  end

  add_index "appointments", ["doctor_id", "place_id", "start_time"], name: "appointment_unique", unique: true
  add_index "appointments", ["doctor_id", "start_time"], name: "doctor_appointment_unique", unique: true
  add_index "appointments", ["place_id", "start_time"], name: "place_appointment_unique", unique: true

  create_table "clinic_histories", force: :cascade do |t|
    t.string   "entry"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diseases", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mail"
    t.string   "phone"
    t.string   "mobile"
    t.string   "address"
    t.string   "specialty"
    t.string   "working_days"
  end

  create_table "patient_diseases", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "disease_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "identifier"
    t.string   "address"
    t.string   "phone"
    t.string   "phone_mobile"
    t.string   "contact_phone"
    t.string   "base_medication"
    t.integer  "referring_doctor_id"
    t.integer  "qualifying_pathology_id"
    t.integer  "protocol_id"
    t.integer  "target_protocol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "patient_number"
    t.string   "contact_name"
    t.string   "contact_relationship"
    t.text     "clinical_history"
  end

  create_table "protocols", force: :cascade do |t|
    t.string   "name"
    t.integer  "patients_commitment"
    t.integer  "principal_investigator_id"
    t.integer  "sub_investigator_id"
    t.integer  "coordinator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "backup_coordinator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "role_ids"
  end

  create_table "visits", force: :cascade do |t|
    t.string   "name"
    t.integer  "protocol_id"
    t.integer  "duration"
    t.text     "activities"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
