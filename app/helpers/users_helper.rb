require_relative '../models/steam_adapter'

module UsersHelper

	def self.check_steam_id(user, steam_id)
		if user.user_steam_id != steam_id
      user.update_attributes user_steam_id: steam_id
		end
		response = SteamAdapter.new(user.user_steam_id).get_player_summaries
		p response
	end

	def current_user
		if session[:id]
			# User.find(session[:id])
			@current_user ||= User.find_by_id(session[:id])
		else
			false
		end
	end

	def current_user_groups
		if session[:id]
			@current_user_groups = current_user.groups
		else
			"NO GROUPS SELECTED"
		end
	end

end
