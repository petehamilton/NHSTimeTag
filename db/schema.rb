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

ActiveRecord::Schema.define(:version => 20110617143946) do

  create_table "appointments", :force => true do |t|
    t.datetime "datetime"
    t.integer  "patient_id"
    t.integer  "clinic_id"
    t.boolean  "attending",  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clinics", :force => true do |t|
    t.string   "name"
    t.integer  "hospital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultants", :force => true do |t|
    t.string   "title"
    t.string   "last_name"
    t.integer  "clinic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospitals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.boolean  "contact_text"
    t.boolean  "contact_email"
    t.boolean  "contact_phonecall"
    t.string   "nhs_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
