users - 
	username
	password_hash
	zip_code
	birthday
	email
	bio

	has many groups
	has many games

	







events - 
	event name
	event date time
	event type_id
	event active boolean
	event location



groups
	has users
	has many admins as user
	user has admin boolean
	
	group_name
	



games
	game_name
	game_type
	game_img




	# "appid": 238460,
	# 			"name": "BattleBlock Theater",
	# 			"playtime_2weeks": 75,
	# 			"playtime_forever": 75,
	# 			"img_icon_url": "2f258aaff583d797812cdcf24830d5992f48733b",
	# 			"img_logo_url": "13380473acaa95f843301b8a21a383790ae384de"
	
	game belongs to many users, groups








notes on Travis ci

bake in travis after writing first spec

make repo public and add travsCI under webhooks and services

create travis.yml file

reloase 0 by 530
repo up and heroku


as much project workflow as possible









