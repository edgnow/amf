# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090508194853) do

  create_table "accounts", :force => true do |t|
    t.integer  "user_id",                                                                 :null => false
    t.integer  "plan_id",                                                                 :null => false
    t.string   "cc_num",     :limit => 64,                                                :null => false
    t.string   "cc_expire",  :limit => 64,                                                :null => false
    t.string   "cc_code",    :limit => 64,                                                :null => false
    t.integer  "points",                                                 :default => 0,   :null => false
    t.decimal  "balance",                  :precision => 4, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
  end

  create_table "languages", :force => true do |t|
    t.string "name", :limit => 32, :null => false
    t.string "code", :limit => 8,  :null => false
  end

  create_table "plans", :force => true do |t|
    t.string "name",          :limit => 32,                             :null => false
    t.string "from_language", :limit => 16, :default => "Any Language", :null => false
    t.string "to_language",   :limit => 16, :default => "Any Language", :null => false
    t.string "pricing",       :limit => 32,                             :null => false
  end

  create_table "translations", :force => true do |t|
    t.integer  "account_id",        :null => false
    t.integer  "start_language_id", :null => false
    t.integer  "end_language_id",   :null => false
    t.integer  "upload_id"
    t.string   "start_text",        :null => false
    t.string   "end_text"
    t.datetime "translated_at",     :null => false
  end

  create_table "translators", :force => true do |t|
    t.integer "account_id",  :null => false
    t.integer "language_id", :null => false
  end

  create_table "uploads", :force => true do |t|
    t.string   "s3_key",      :limit => 256,                    :null => false
    t.boolean  "is_vertical",                :default => false, :null => false
    t.datetime "uploaded_at",                                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :null => false
    t.string   "crypted_password",                     :null => false
    t.string   "password_salt",                        :null => false
    t.string   "persistence_token",                    :null => false
    t.boolean  "active",            :default => false, :null => false
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token",  :default => "",    :null => false
  end

  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
