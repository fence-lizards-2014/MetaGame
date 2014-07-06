require_relative '../models/steam_adapter'

module UsersHelper

	def current_user
		user ||= User.find(session[:id]) if session[:id]
	end

	def self.check_steam_id(user, steam_id)
		if user.user_steam_id != steam_id
      user.update_attributes user_steam_id: steam_id
		end
		response = SteamAdapter.new(user.user_steam_id).get_player_summaries
		p response
	end
end
