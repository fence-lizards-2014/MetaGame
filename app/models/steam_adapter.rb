require 'ostruct'

class SteamAdapter
	include HTTParty
	attr_accessor :key, :steam_id

	base_uri 'http://api.steampowered.com'

	NOT_VALID_USER = 'UNABLE TO FIND STEAM USER'
	NOT_VALID_STEAM_ID = 'INVALID STEAM ID'

	def initialize steam_id
		# need to make env
		@key = '2CA9866DD532D38F34B6B2CBBD968E92'
		@steam_id = steam_id
	end

	def get_player_summaries
		self.class.get "/#{get_type_user}/GetPlayerSummaries/#{v2}/#{get_ids}" || OpenStruct.new(user: NOT_VALID_USER, steam_id: NOT_VALID_STEAM_ID)
	end

	def get_friend_list
		self.class.get "/#{get_type_user}/GetFriendList/#{v1}/#{get_ids}&#{relationship}" || OpenStruct.new(user: NOT_VALID_USER, steam_id: NOT_VALID_STEAM_ID)
	end

	def get_games
		self.class.get "/#{get_type_player_service}/GetOwnedGames/#{v1}/#{get_ids}&#{format}&#{app_info}" || OpenStruct.new(user: NOT_VALID_USER, steam_id: NOT_VALID_STEAM_ID)
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

	def format
		"format=json"
	end

	def app_info
		"Include_appinfo=1"
	end

	def relationship
		"relationship=friend"
	end

	def v1
		"v0001"
	end

	def v2
		"v0002"
	end
end
