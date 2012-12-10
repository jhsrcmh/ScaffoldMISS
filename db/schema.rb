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

ActiveRecord::Schema.define(:version => 20121209130659) do

  create_table "backup_types", :force => true do |t|
    t.string   "backuptypename"
    t.integer  "importance"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "backupinfs", :force => true do |t|
    t.string   "name"
    t.string   "backinf"
    t.integer  "backupclass_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.text     "remarkinf"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "file_path"
  end

  create_table "check_classes", :force => true do |t|
    t.string   "checkclassname"
    t.integer  "priority"
    t.text     "remarkinf"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "checkinfs", :force => true do |t|
    t.integer  "project_id"
    t.integer  "checkclass_id"
    t.string   "checkform"
    t.integer  "user_id"
    t.time     "checktime"
    t.text     "remarkinf"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "file_path"
  end

  create_table "close_types", :force => true do |t|
    t.string   "closetypename"
    t.integer  "priority"
    t.text     "remarkinf"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "closeinfs", :force => true do |t|
    t.string   "name"
    t.string   "Closeinf"
    t.integer  "project_id"
    t.string   "closedtl"
    t.datetime "closetime"
    t.integer  "user_id"
    t.integer  "closeinf_type_id"
    t.text     "remarkinf"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "file_path"
  end

  create_table "everyday_checks", :force => true do |t|
    t.integer  "project_id"
    t.integer  "everydaycheck_id"
    t.string   "everydaycheckform"
    t.integer  "user_id"
    t.time     "checktime"
    t.text     "remarkinf"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_path"
  end

  create_table "everydaycheck_types", :force => true do |t|
    t.string   "everydaychecktype"
    t.integer  "priority"
    t.text     "remarkinf"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "projname"
    t.string   "projinf"
    t.integer  "security_id"
    t.integer  "ifon"
    t.integer  "user_id"
    t.time     "time"
    t.text     "remarkinf"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "reform_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reforms", :force => true do |t|
    t.integer  "project_id"
    t.string   "reformdoc"
    t.string   "reformmark"
    t.string   "reformresponse"
    t.integer  "reformtype"
    t.integer  "user_id"
    t.text     "remarkinf"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "file_path_a"
    t.string   "file_path_b"
  end

  create_table "securities", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "securityclass_id"
    t.string   "securitydtl"
    t.integer  "ifpass"
    t.time     "time"
    t.integer  "user_id"
    t.text     "remarkinf"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "file_path"
  end

  create_table "security_classes", :force => true do |t|
    t.string   "securityclassname"
    t.integer  "securityclassgrade"
    t.string   "securityfathername"
    t.text     "remarkinf"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "security_proj_types", :force => true do |t|
    t.string   "securityprojtypename"
    t.string   "priority"
    t.text     "remarkinf"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "security_projs", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.string   "detail"
    t.integer  "ifpass"
    t.integer  "user_id"
    t.integer  "security_proj_type_id"
    t.text     "remarkinf"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "file_path"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "userpwd"
    t.integer  "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "worklogs", :force => true do |t|
    t.integer  "project_id"
    t.string   "logdoc"
    t.time     "time"
    t.string   "place"
    t.integer  "user_id"
    t.text     "remarkinf"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
