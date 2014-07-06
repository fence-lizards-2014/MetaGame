class Game < ActiveRecord::Base
  attr_accessible :game_img_icon_url, :game_img_logo_url, :game_name, :game_playtime_2weeks, :game_playtime_forever

  has_many :users
  has_many :user_games, through: :users

  has_many :groups
  has_many :group_games, through: :groups

end