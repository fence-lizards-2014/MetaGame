####################################
#########              #############
########   1st Draft    ############
#########              #############
####################################
####################################



users
	use_steam_id
	username
	password_hash
	zip_code
	email
	bio

	has many groups
	has many games


events
	event_name
	event_game
	event_description
	event_date time
	event_type_id
	event_active boolean
	event_zip
	event_location



groups
	has many users
	has many games
	has many events
	has many admins as user
	
	group_name
	group_description
	group_tagline
	group_logo_url


games 
  t.string   "game_name"
  t.string   "game_img_icon_url"
  t.string   "game_img_logo_url"
  t.integer  "game_steam_appid"
  t.integer  "game_playtime_2weeks"
  t.integer  "game_playtime_forever"
  t.integer  "user_id"
  t.integer  "group_id"
  t.datetime "created_at"
  t.datetime "updated_at"

belongs to user
belongs to group



####################################
#########              #############
########   2nd Draft    ############
#########              #############
####################################
####################################


CREATE TABLE "Users" (
"id"  SERIAL ,
"user_friends_id" INTEGER ,
"user_zipcode" INTEGER ,
"username" CHAR ,
"user_steam_id" CHAR ,
"password_hash" CHAR ,
"user_email" CHAR ,
"user_bio" MEDIUMTEXT ,
"user_online" SET ,
PRIMARY KEY ("id")
);

CREATE TABLE "Events" (
"id"  SERIAL ,
"event_name" CHAR ,
"event_game_title" CHAR ,
"event_description" CHAR ,
"event_location" CHAR ,
"event_active" SET ,
"event_date" DATETIME ,
"event_type_id" INTEGER ,
"event_zipcode" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "Groups" (
"id"  SERIAL ,
"group_name" CHAR ,
"group_description" CHAR ,
"group_logo_url" CHAR ,
"group_tagline" CHAR ,
PRIMARY KEY ("id")
);

CREATE TABLE "Games" (
"id"  SERIAL ,
"game_name" CHAR ,
"game_img_icon_url" CHAR ,
"game_img_logo_url" CHAR ,
"game_steam_appid" INTEGER ,
"game_playtime_2weeks" INTEGER ,
"game_playtime_forever" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "UserGroups" (
"id"  SERIAL ,
"user_id" INTEGER ,
"group_id" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "UserGames" (
"id"  SERIAL ,
"user_id" INTEGER ,
"game_id" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "UserEvents" (
"id"  SERIAL ,
"user_id" INTEGER ,
"event_id" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "UserAdmins" (
"id"  SERIAL ,
"user_id" INTEGER ,
"event_id" INTEGER ,
"group_id" INTEGER ,
"admin" SET ,
PRIMARY KEY ("id")
);

CREATE TABLE "GroupUsers" (
"id"  SERIAL ,
"group_id" INTEGER ,
"user_id" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "GroupEvents" (
"id"  SERIAL ,
"group_id" INTEGER ,
"event_id" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "GroupGames" (
"id"  SERIAL ,
"group_id" INTEGER ,
"game_id" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "UserFriends" (
"id"  SERIAL ,
"admin_id" INTEGER ,
PRIMARY KEY ("id")
);

ALTER TABLE "Users" ADD FOREIGN KEY ("user_friends_id") REFERENCES "UserFriends" ("id");
ALTER TABLE "UserGroups" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");
ALTER TABLE "UserGroups" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");
ALTER TABLE "UserGames" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");
ALTER TABLE "UserGames" ADD FOREIGN KEY ("game_id") REFERENCES "Games" ("id");
ALTER TABLE "UserEvents" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");
ALTER TABLE "UserEvents" ADD FOREIGN KEY ("event_id") REFERENCES "Events" ("id");
ALTER TABLE "UserAdmins" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");
ALTER TABLE "UserAdmins" ADD FOREIGN KEY ("event_id") REFERENCES "Events" ("id");
ALTER TABLE "UserAdmins" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");
ALTER TABLE "GroupUsers" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");
ALTER TABLE "GroupUsers" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");
ALTER TABLE "GroupEvents" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");
ALTER TABLE "GroupEvents" ADD FOREIGN KEY ("event_id") REFERENCES "Events" ("id");
ALTER TABLE "GroupGames" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");
ALTER TABLE "GroupGames" ADD FOREIGN KEY ("game_id") REFERENCES "Games" ("id");















####################################
#########              #############
########   3rd Draft    ############
#######   table design   ###########
####################################
####################################


ActiveRecord::Schema.define(:version => 20140705204822) do

  create_table "events", :force => true do |t|
    t.string   "event_name"
    t.string   "event_game_title"
    t.string   "event_description"
    t.string   "event_location"
    t.boolean  "event_active",      :default => true
    t.datetime "event_date"
    t.integer  "event_type_id"
    t.integer  "event_zipcode"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

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
    t.string   "group_logo_url"
    t.string   "group_tagline"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "user_admins", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.integer "event_id"
    t.boolean "admin"
  end

  create_table "user_events", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  create_table "user_friends", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.integer "admin_id"
  end

  create_table "user_games", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "user_groups", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "users", :force => true do |t|
    t.string   "user_steam_id"
    t.string   "username"
    t.string   "password_hash"
    t.string   "user_email"
    t.string   "user_avatar_url"
    t.integer  "user_zipcode"
    t.text     "user_bio"
    t.integer  "group_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end



####################################
#########              #############
########   3rd Draft    ############
#######   model design   ###########
####################################
####################################


class User < ActiveRecord::Base

  attr_accessible :password_hash, :user_bio, :user_email, :username, :user_zipcode, :user_steam_id, :user_avatar_url, :id, :created_at, :updated_at

	has_many :user_friends
	has_many :friends, through: :user_friends, source: :user, class_name: "User"

  has_many :games
	has_many :user_games, through: :games

	has_many :groups
  has_many :user_groups, through: :groups

  has_many :events
  has_many :user_events, through: :events
  has_many :group_events, through: :events


  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end



class Group < ActiveRecord::Base
  attr_accessible :group_description, :group_logo_url, :group_name, :group_tagline
  
  has_many :users
  has_many :group_users, through: :users

	has_many :admins, class_name: "User"

  has_many :events
  has_many :group_events, through: :groups

end






class Event < ActiveRecord::Base
  attr_accessible :event_active, :event_date, :event_description, :event_game_title, :event_location, :event_name, :event_type_id, :event_zipcode
  
  has_many :groups
  has_many :groups_events, through: :events

	has_many :admins
  has_many :user_admins, through: :admins
	
  has_many :users
  has_many :user_events, through: :events

end






class Game < ActiveRecord::Base
  attr_accessible :game_img_icon_url, :game_img_logo_url, :game_name, :game_playtime_2weeks, :game_playtime_forever

  has_many :users
  has_many :user_games, through: :users

  has_many :groups
  has_many :group_games, through: :groups

end






class UserFriend < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :friend, class_name: "User"

end





####################################
#########              #############
########   3rd Draft    ############
#######   SQL Design XML ###########
####################################
####################################



