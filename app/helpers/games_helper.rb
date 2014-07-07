module GamesHelper
	def self.parse_steam_games(response)
		games = response[:games]["response"]["games"]
		games.each do |game|
			Game.create(game_name: game["name"],
									game_steam_appid: game["appid"], 
									game_img_url: "http://media.steampowered.com/steamcommunity/public/images/apps/#{game["appid"]}/#{game["img_logo_url"]}.jpg", 
									game_icon_url: "http://media.steampowered.com/steamcommunity/public/images/apps/#{game["appid"]}/#{game["img_icon_url"]}.jpg", 
									game_playtime_forever: game["playtime_forever"])
		end
	end
end
# [{"appid"=>33900, "name"=>"Arma 2", "playtime_forever"=>0, "img_icon_url"=>"7fd2d12d3f91ee3e69955121323bb89063ea304e", "img_logo_url"=>"9d4d576e4662870232eae35e50b041f93a9a6fa0"}, {"appid"=>33930, "name"=>"Arma 2: Operation Arrowhead", "playtime_forever"=>18, "img_icon_url"=>"32431d84014bf4652181f45bc7c06f1ca3f34363", "img_logo_url"=>"c5eaa05810878e600d117be1c96107a20cd9b262", "has_community_visible_stats"=>true}, {"appid"=>219540, "name"=>"Arma 2: Operation Arrowhead Beta (Obsolete)", "playtime_forever"=>6, "img_icon_url"=>"32431d84014bf4652181f45bc7c06f1ca3f34363", "img_logo_url"=>"c2ea07874fb1a776e4c5bfc659e5f296d656777d"}, {"appid"=>8930, "name"=>"Sid Meier's Civilization V", "playtime_forever"=>33, "img_icon_url"=>"fbe80c4743e226f0bf65559c91b12953d4446808", "img_logo_url"=>"2203f62bd1bdc75c286c13534e50f22e3bd5bb58", "has_community_visible_stats"=>true}, {"appid"=>219640, "name"=>"Chivalry: Medieval Warfare", "playtime_forever"=>5166, "img_icon_url"=>"d4628be29b7e97d93a3404870dfe79642b90b907", "img_logo_url"=>"dd3488ae69593cedf5e73b818ae98e6737aa956c", "has_community_visible_stats"=>true}, {"appid"=>232210, "name"=>"Chivalry: Medieval Warfare Beta", "playtime_forever"=>3, "img_icon_url"=>"d4628be29b7e97d93a3404870dfe79642b90b907", "img_logo_url"=>"dd3488ae69593cedf5e73b818ae98e6737aa956c", "has_community_visible_stats"=>true}, {"appid"=>205790, "name"=>"Dota 2 Test", "playtime_forever"=>0, "img_icon_url"=>"", "img_logo_url"=>""}, {"appid"=>8870, "name"=>"BioShock Infinite", "playtime_forever"=>775, "img_icon_url"=>"4ebaf5f9ee74f50152f7ff361debef7553fa0e4e", "img_logo_url"=>"870bb889e192cf8d31876ed04d329a5d51c6fc2c", "has_community_visible_stats"=>true}]