require "firebase_token_generator"


class FireBaseToken
def self.generate
	SECRET = '<IMXKEVWitFxg1nyyAfaFah8mNn85sMhr78yQZN6t>'
	options = {:admin => true}
	auth_data = {:auth_data => 'foo', :other_auth_data => 'bar'}

	generator = Firebase::FirebaseTokenGenerator.new(SECRET)
	return @token = generator.create_token(auth_data, options)
end





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

