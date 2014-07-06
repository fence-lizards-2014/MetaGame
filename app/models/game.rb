require 'json'

class Game < ActiveRecord::Base
  attr_accessible :game_img_url, :game_name, :game_playtime_2weeks, :game_playtime_forever, :game_description

  has_many :users
  has_many :user_games, through: :users

  has_many :groups
  has_many :group_games, through: :groups

  def self.parse_json(file)
    games_list = JSON.parse(File.open(file).read)
    games_list['results'].each{ |result| Game.create( Hash[game_description: result['description'], game_img_url: result['image'], game_name: result['name']]) }
  end
end
