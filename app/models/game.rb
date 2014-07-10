require 'json'

class Game < ActiveRecord::Base
  attr_accessible :game_img_url, :game_name, :game_playtime_2weeks, :game_playtime_forever, :game_description, :game_steam_appid, :game_icon_url

  has_many :users
  has_many :user_games, through: :users

  has_many :groups
  has_many :group_games, through: :groups
  has_many :tournaments


  def self.parse_json file
    games_list = JSON.parse(File.open(file).read)
    games_list['results'].each do |result| 
    	Game.create( Hash[game_description: result['description'], 
    										game_img_url: result['image']["screen_url"], 
    										game_name: result['name']]) 
    end
  end

  def self.parse_steam_games response, user
    games = response[:games]["response"]["games"]
    games.each do |game|
      user.games << Game.create(game_name: game["name"],
                  game_steam_appid: game["appid"], 
                  game_img_url: "http://media.steampowered.com/steamcommunity/public/images/apps/#{game["appid"]}/#{game["img_logo_url"]}.jpg", 
                  game_icon_url: "http://media.steampowered.com/steamcommunity/public/images/apps/#{game["appid"]}/#{game["img_icon_url"]}.jpg", 
                  game_playtime_forever: game["playtime_forever"])
    end
  end
end
