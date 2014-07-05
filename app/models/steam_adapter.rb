module SteamAdapter
	extend self
	attr_accessor :key

	def setup
		self.key = '2CA9866DD532D38F34B6B2CBBD968E92'
	end

	def get_player_summaries
		response = HTTParty.get "#{get_base_uri}/#{get_type_user}/GetPlayerSummaries/v0002/#{get_ids}"
		response.body
	end

	def get_friend_list
		response = HTTParty.get "#{get_base_uri}/#{get_type_user}/GetFriendList/v0001/#{get_ids}&relationship=friend"
		reponse.body
	end

	def get_games
		response = HTTParty.get "#{get_base_uri}/#{get_type_player_service}/GetOwnedGames/v0001/#{get_ids}&format=json"
		response.body
	end

	private

	def get_base_uri
		"http://api.steampowered.com"
	end

	def get_type_player_service
		"IPlayerService"
	end

	def get_type_user
		"ISteamUser"
	end

	def get_ids
		"?key=#{self.key}&steamids=76561198076227521"
	end
end

