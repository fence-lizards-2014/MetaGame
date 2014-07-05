require 'ostruct'

class GiantBombAdapter
	include HTTParty
	attr_accessor :key, :title

	base_uri 'http://www.giantbomb.com/api'

	INVALID_TITLE = 'No such game exists! Please try again!'

	def initialize title
		@key = '5a4c47474d09321305c85ae777a19fdf647d8257'
		@title = URI.escape title
	end

	def search
		self.class.get "/#{get_type}#{get_ids}&#{format}&#{query}&#{resource}" || OpenStruct.new(title: INVALID_TITLE)
	end

	private

	def get_type
		'search'
	end

	def get_ids
		'?api_key=#{@key}'
	end

	def format
		'format=json'
	end

	def query
		'query=#{@title}'
	end

	def resource
		'resources=game'
	end

end

# http://www.giantbomb.com/api/search?api_key=5a4c47474d09321305c85ae777a19fdf647d8257&format=json&query=banjo-kazooie&resources=game

# GiantBombAdapter.search params[:title]

