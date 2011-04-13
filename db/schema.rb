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

ActiveRecord::Schema.define(:version => 20110405050346) do

  create_table "ads", :force => true do |t|
    t.string   "title",                               :null => false
    t.text     "body",                                :null => false
    t.string   "ad_type",                             :null => false
    t.string   "ip"
    t.integer  "hits"
    t.string   "status",      :default => "inactive"
    t.float    "price",       :default => 0.0
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ads", ["price"], :name => "index_ads_on_price"
  add_index "ads", ["title"], :name => "index_ads_on_title"

  create_table "locations", :force => true do |t|
    t.string   "location_name",                                                      :null => false
    t.string   "location_type",                                                      :null => false
    t.integer  "location_parent_id",                                                 :null => false
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "latitude",           :precision => 12, :scale => 9, :default => 0.0
    t.decimal  "longitude",          :precision => 12, :scale => 9, :default => 0.0
  end

  add_index "locations", ["location_name"], :name => "index_locations_on_location_name", :unique => true
  add_index "locations", ["postcode"], :name => "index_locations_on_postcode"

  create_table "pair_tags", :force => true do |t|
    t.integer  "supertag_id", :null => false
    t.integer  "subtag_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id",     :null => false
    t.integer  "ad_id",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "tag_name",                       :null => false
    t.integer  "no_of_supertags", :default => 0
    t.integer  "no_of_subtags",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                  :null => false
    t.string   "email",                                 :null => false
    t.string   "telephone"
    t.string   "encrypted_password",                    :null => false
    t.string   "salt",                                  :null => false
    t.boolean  "admin",              :default => false
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["telephone"], :name => "index_users_on_telephone"

end
