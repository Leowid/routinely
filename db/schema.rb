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

ActiveRecord::Schema.define(:version => 20130120181920) do

  create_table "routines", :force => true do |t|
    t.string   "email"
    t.string   "item"
    t.string   "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "bio"
    t.text     "routine"
    t.string   "twitter"
  end

  add_index "users", ["bio"], :name => "index_users_on_bio"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["routine"], :name => "index_users_on_routine"
  add_index "users", ["twitter"], :name => "index_users_on_twitter"

end
