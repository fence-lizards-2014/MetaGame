require 'ostruct'

class Zipcode
	include HTTParty
	attr_accessor :key, :zipcode

	base_uri 'https://zipcodedistanceapi.redline13.com/rest/'

	def initialize zipcode
		@zipcode = zipcode
		@key = "xnbUucWA9nby0aIQYHDw7PESptfWkqzSOKMjXJU676E7gnXe5BLcqp4QTkMdLm5z"
	end

	def by_radius distance
		self.class.get "/#{@key}/radius.json/#{@zipcode}/#{distance}/miles"
	end
end

