require 'ostruct'

class SteamAdapter
	include HTTParty
	attr_accessor :key, :steam_id

	base_uri 'http://api.steampowered.com'

	def initialize steam_id
		# need to make env
		@key = '2CA9866DD532D38F34B6B2CBBD968E92'
		@steam_id = steam_id
	end

	def get_player_summaries
		self.class.get "/#{get_type_user}/GetPlayerSummaries/v0002/#{get_ids}"
	end

	def get_friend_list
		response = self.class.get "#{base_uri}/#{get_type_user}/GetFriendList/v0001/#{get_ids}&relationship=friend"
		reponse.body
	end

	def get_games
		response = self.class.get "#{base_uri}/#{get_type_player_service}/GetOwnedGames/v0001/#{get_ids}&format=json"
		response.body
	end

	private

	def get_type_player_service
		"IPlayerService"
	end

	def get_type_user
		"ISteamUser"
	end

	def get_ids
		"?key=#{@key}&steamids=#{@steam_id}"
	end
end
