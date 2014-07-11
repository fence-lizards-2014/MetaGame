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

ActiveRecord::Schema.define(:version => 20140708232035) do

  create_table "events", :force => true do |t|
    t.string   "event_name"
    t.string   "event_game_title"
    t.string   "event_description"
    t.string   "event_location"
    t.boolean  "event_active",      :default => true
    t.datetime "event_date"
    t.string   "event_type"
    t.integer  "event_zipcode"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "game_name"
    t.text     "game_description"
    t.text     "game_img_url"
    t.text     "game_icon_url"
    t.integer  "game_steam_appid"
    t.integer  "game_playtime_2weeks"
    t.integer  "game_playtime_forever"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "group_events", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "event_id"
  end

  create_table "group_games", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "game_id"
  end

  create_table "group_users", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "group_name"
    t.text     "group_description"
    t.text     "group_logo_url"
    t.string   "group_tagline"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "posts", :force => true do |t|
    t.text     "post_content"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tournaments", :force => true do |t|
    t.string  "tourney_name"
    t.text    "tourney_rules"
    t.integer "tourney_max_players"
    t.boolean "winner",              :default => false
    t.string  "tourney_url"
    t.integer "event_id"
    t.integer "game_id"
  end

  create_table "user_admins", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.integer "event_id"
    t.boolean "admin"
  end

  create_table "user_events", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_friends", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.integer "admin_id"
  end

  create_table "user_games", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_steam_id"
    t.string   "username"
    t.string   "login"
    t.string   "password_hash"
    t.string   "user_email"
    t.string   "user_avatar_url"
    t.integer  "user_zipcode"
    t.text     "user_bio"
    t.integer  "group_id"
    t.integer  "event_id"
    t.integer  "tournament_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
