require 'ostruct'

class GiantBombAdapter
	include HTTParty
	attr_accessor :key, :title

	base_uri 'http://www.giantbomb.com/api'

	INVALID_TITLE = 'No such game exists! Please try again!'
	INVALID_ID = 'No such console exists!'

	def initialize title, game_id
		@key = '5a4c47474d09321305c85ae777a19fdf647d8257'
		@title = URI.escape title
		@game_id = game_id
	end

	def search
		self.class.get "/#{get_type}?#{get_ids}&#{format}&#{query}&#{resource}" || OpenStruct.new(title: INVALID_TITLE)
	end

	def get_games_by_console
		self.class.get "/#{game_type}/?#{format}&#{get_ids}&#{filter}&#{field_list}"
	end

	private

	def game_type
		"games"
	end

	def get_type
		'search'
	end

	def get_ids
		"api_key=#{@key}"
	end

	def format
		'format=json'
	end

	def query
		"query=#{@title}"
	end

	def resource
		'resources=game'
	end

	def filter
		"filter=platforms:#{@game_id}"
	end

	def field_list
		"field_list=genres,name"
	end

end

# http://www.giantbomb.com/api/games/?format=json&api_key=5a4c47474d09321305c85ae777a19fdf647d8257&filter=platforms:43&field_list=genres,name

# nes - 21
# snes - 9
# n64 - 43
# gamecube - 23
# wii - 36
# wii u - 139

# ps1 - 22
# ps2 - 19
# ps3 - 88 
# ps4 - 146

# xbox - 32
# xbox 360 - 20
# xbox one - 145

# pc - 94
