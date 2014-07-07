require_relative '../models/steam_adapter'

module UsersHelper
	extend self

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

	def current_user
			# User.find(session[:id])
			@current_user ||= User.find_by_id(session[:id]) if session[:id]
	end

	def current_user_groups
		if session[:id]
			@current_user_groups = current_user.groups
		else
			@current_user_groups = ["NO GROUPS SELECTED"]
		end
	end
	

	def current_user_events
		if session[:id]
			@current_user_events = current_user.events
		else
			@current_user_events = ["No Events Listed"]
		end
	end

end







































