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

ActiveRecord::Schema.define(:version => 20130204062921) do

  create_table "character_attributes", :force => true do |t|
    t.integer  "character_id"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "character_certificates", :force => true do |t|
    t.integer  "character_id"
    t.integer  "certificate_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "character_skills", :force => true do |t|
    t.integer  "character_id"
    t.integer  "type_id"
    t.decimal  "skillpoints",  :precision => 10, :scale => 0
    t.integer  "level"
    t.integer  "published"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "characters", :force => true do |t|
    t.integer  "user_id"
    t.integer  "character_id"
    t.string   "name"
    t.date     "dob"
    t.string   "race"
    t.string   "bloodline"
    t.string   "ancestry"
    t.string   "gender"
    t.string   "corporation_name"
    t.integer  "corporation_id"
    t.string   "alliance_name"
    t.integer  "alliance_id"
    t.string   "clone_name"
    t.integer  "clone_skill_points"
    t.decimal  "balance",              :precision => 10, :scale => 0
    t.datetime "cached_until"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.datetime "killlog_cached_until"
  end

  create_table "corporation_account_balances", :force => true do |t|
    t.integer  "account_id"
    t.integer  "account_key"
    t.decimal  "balance",        :precision => 10, :scale => 0
    t.date     "cached_until"
    t.integer  "corporation_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "corporations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "corp_id"
    t.string   "name"
    t.string   "ticker"
    t.integer  "ceoid"
    t.string   "ceo_name"
    t.integer  "station_id"
    t.string   "station_name"
    t.text     "description"
    t.string   "url"
    t.integer  "alliance_id"
    t.string   "alliance_name"
    t.string   "tax_rate"
    t.integer  "member_count"
    t.integer  "member_limit"
    t.integer  "shares"
    t.datetime "cached_until"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "killlog_attackers", :force => true do |t|
    t.integer  "killlog_id"
    t.integer  "alliance_id"
    t.string   "alliance_name"
    t.integer  "character_id"
    t.string   "character_name"
    t.integer  "corporation_id"
    t.string   "corporation_name"
    t.integer  "damage_done"
    t.integer  "faction_id"
    t.string   "faction_name"
    t.boolean  "final_blow"
    t.float    "security_status"
    t.integer  "ship_type_id"
    t.integer  "weapon_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "killlog_items", :force => true do |t|
    t.integer  "killlog_id"
    t.integer  "flag"
    t.integer  "qty_dropped"
    t.integer  "qty_destroyed"
    t.integer  "type_id"
    t.integer  "singleton"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "killlog_victims", :force => true do |t|
    t.integer  "killlog_id"
    t.integer  "alliance_id"
    t.string   "alliance_name"
    t.integer  "character_id"
    t.string   "character_name"
    t.integer  "corporation_id"
    t.string   "corporation_name"
    t.integer  "damage_taken"
    t.integer  "faction_id"
    t.string   "faction_name"
    t.integer  "ship_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "killlogs", :force => true do |t|
    t.integer  "character_id"
    t.integer  "kill_id"
    t.integer  "solar_system_id"
    t.datetime "kill_time"
    t.integer  "moon_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.integer  "user_limit"
    t.integer  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "plans", ["name"], :name => "index_plans_on_name"

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.string   "created_by"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "starbase_detail_combat_setting_attribs", :force => true do |t|
    t.integer  "starbase_detail_combat_setting_id"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "starbase_detail_combat_settings", :force => true do |t|
    t.integer  "starbase_detail_id"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "starbase_detail_fuels", :force => true do |t|
    t.integer  "starbase_detail_id"
    t.integer  "type_id"
    t.integer  "quantity"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "starbase_detail_settings", :force => true do |t|
    t.integer  "starbase_detail_id"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "starbase_details", :force => true do |t|
    t.datetime "cached_until"
    t.integer  "starbase_id"
    t.integer  "state"
    t.datetime "state_timestamp"
    t.datetime "online_timestamp"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "starbases", :force => true do |t|
    t.integer  "item_id"
    t.integer  "type_id"
    t.integer  "location_id"
    t.integer  "moon_id"
    t.integer  "state"
    t.datetime "state_timestamp"
    t.datetime "online_timestamp"
    t.integer  "standing_owner_id"
    t.datetime "cached_until"
    t.integer  "corporation_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "subdomains", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subdomains", ["name"], :name => "index_subdomains_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
    t.string   "apikey"
    t.string   "secretkey"
    t.integer  "apiverified"
    t.string   "primary_character_id"
    t.string   "corp_apikey"
    t.string   "corp_apisecret"
    t.string   "corporation_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_plans", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "plan_id"
  end

  add_index "users_plans", ["user_id", "plan_id"], :name => "index_users_plans_on_user_id_and_plan_id"

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "users_subdomains", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "subdomain_id"
  end

  add_index "users_subdomains", ["user_id", "subdomain_id"], :name => "index_users_subdomains_on_user_id_and_subdomain_id"

end
