require_relative '../models/steam_adapter'

module UsersHelper
	extend self

	private

	def current_user
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


