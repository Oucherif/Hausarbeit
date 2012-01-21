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

ActiveRecord::Schema.define(:version => 20120121133748) do

  create_table "addcapcosts", :force => true do |t|
    t.integer  "timestep_id"
    t.float    "addcapcostvalue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "capusages", :force => true do |t|
    t.integer  "product_id"
    t.integer  "segment_id"
    t.integer  "preperiod_id"
    t.float    "capusagevalue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "demands", :force => true do |t|
    t.integer  "product_id"
    t.integer  "timestep_id"
    t.float    "demandvalue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maxaddcaps", :force => true do |t|
    t.integer  "segment_id"
    t.integer  "timestep_id"
    t.float    "maxaddcapvalue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preperiods", :force => true do |t|
    t.integer  "product_id"
    t.integer  "preperiodnumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prodcaps", :force => true do |t|
    t.integer  "segment_id"
    t.integer  "timestep_id"
    t.float    "prodcapvalue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "productname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", :force => true do |t|
    t.string   "segmentname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storagecosts", :force => true do |t|
    t.integer  "product_id"
    t.float    "storagecostvalue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timesteps", :force => true do |t|
    t.integer  "stepnumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
