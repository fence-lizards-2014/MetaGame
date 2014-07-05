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

ActiveRecord::Schema.define(:version => 20140704210933) do

  create_table "games", :force => true do |t|
    t.string   "game_name"
    t.string   "game_img_icon_url"
    t.string   "game_img_logo_url"
    t.integer  "game_steam_appid"
    t.integer  "game_playtime_2weeks"
    t.integer  "game_playtime_forever"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_steam_id"
    t.string   "user_name"
    t.string   "password_hash"
    t.string   "user_email"
    t.text     "user_bio"
    t.integer  "user_zipcode"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
