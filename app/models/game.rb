class Game < ActiveRecord::Base
  attr_accessible :game_img_icon_url, :game_img_logo_url, :game_name, :game_playtime_2weeks, :game_playtime_forever
end
