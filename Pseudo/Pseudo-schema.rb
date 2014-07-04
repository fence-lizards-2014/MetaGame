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









