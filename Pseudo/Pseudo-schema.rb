users - 
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






# SAMPLE PULL FROM STEAM
	# "appid": 238460,
	# 			"name": "BattleBlock Theater",
	# 			"playtime_2weeks": 75,
	# 			"playtime_forever": 75,
	# 			"img_icon_url": "2f258aaff583d797812cdcf24830d5992f48733b",
	# 			"img_logo_url": "13380473acaa95f843301b8a21a383790ae384de"








notes on Travis ci

bake in travis after writing first spec

make repo public and add travsCI under webhooks and services

create travis.yml file

reloase 0 by 530
repo up and heroku


as much project workflow as possible




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









