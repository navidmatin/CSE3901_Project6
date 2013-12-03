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

ActiveRecord::Schema.define(:version => 20131203152015) do

  create_table "events", :force => true do |t|
    t.datetime "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "address"
    t.string   "city"
    t.string   "state"
  end

  create_table "events_users", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "pledges", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "name"
    t.decimal  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pledges", ["event_id"], :name => "index_pledges_on_event_id"
  add_index "pledges", ["user_id"], :name => "index_pledges_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "rank",       :default => false
  end

end
