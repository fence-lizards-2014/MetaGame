require 'json'

class Game < ActiveRecord::Base
  attr_accessible :game_img_url, :game_name, :game_playtime_2weeks, :game_playtime_forever, :game_description, :game_steam_appid, :game_icon_url

  has_many :user_games
  has_many :games, through: :user_games

  has_many :group_games
  has_many :games, through: :group_games
  
  has_many :tournaments


  def self.parse_json file
    games_list = JSON.parse(File.open(file).read)
    games_list['results'].each do |result| 
    	Game.create( Hash[game_description: result['description'], 
    										game_img_url: result['image']["screen_url"], 
    										game_name: result['name'],
                        game_icon_url: result['image']['icon_url']]) 
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

  def self.search_games title
    games = Game.where{game_name =~ "%#{title}%"}
    if games.length > 0
      games
    else
      @returned_game = GiantBombAdapter.new(title).search.parsed_response["results"][0]#["description"]    
      if @returned_game
        game = Game.create(game_name: @returned_game["name"],
                           game_description: @returned_game["description"],
                           game_img_url: @returned_game['image']["screen_url"],
                           game_icon_url: @returned_game['image']['icon_url'])
        games = []
        games << game if game
      else
        []
      end
    end
  end
end
