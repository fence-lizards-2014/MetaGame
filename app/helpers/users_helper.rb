require_relative '../models/steam_adapter'

module UsersHelper
	extend self

	def current_user
		user ||= User.find(session[:id]) if session[:id]
	end

	def self.check_steam_id(user, steam_id, image)
		if user.user_steam_id != steam_id
      user.update_attributes user_steam_id: steam_id, user_avatar_url: image
		else
			user.update_attributes user_avatar_url: image
		end

	end

	def self.make_api_data_calls steam_id
		{ summary: (retrieve_player_summaries steam_id).parsed_response, 
			games: (retrieve_player_games steam_id).parsed_response }
	end

	private

	def retrieve_player_summaries steam_id
		SteamAdapter.new(steam_id).get_player_summaries
	end

	def retrieve_player_games steam_id
		SteamAdapter.new(steam_id).get_games
	end
end
