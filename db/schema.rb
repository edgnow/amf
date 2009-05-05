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

ActiveRecord::Schema.define(:version => 20090505024232) do

  create_table "accounts", :force => true do |t|
    t.integer  "user_id",                                                                 :null => false
    t.integer  "plan_id",                                                                 :null => false
    t.string   "cc_num",     :limit => 64,                                                :null => false
    t.string   "cc_expire",  :limit => 64,                                                :null => false
    t.string   "cc_code",    :limit => 64,                                                :null => false
    t.integer  "points",                                                 :default => 0,   :null => false
    t.decimal  "balance",                  :precision => 4, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",           :limit => 16,                    :null => false
    t.string   "first_name",      :limit => 16,                    :null => false
    t.string   "last_name",       :limit => 16,                    :null => false
    t.string   "hashed_password", :limit => 64,                    :null => false
    t.string   "salt",            :limit => 8,                     :null => false
    t.boolean  "active",                        :default => false, :null => false
    t.datetime "last_login_at",                                    :null => false
    t.datetime "created_at",                                       :null => false
  end

end
