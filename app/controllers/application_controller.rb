class ApplicationController < ActionController::Base
  # protect_from_forgery
  
	def current_user
		@current_user ||= User.find_by_id(session[:id]) if session[:id]
	end

	def current_user_groups
		if session[:id]
			@current_user_groups = current_user.groups
		else
			"NO GROUPS SELECTED"
		end
	end

	def current_user_events
		if session[:id]
			@current_user_events = current_user.events
		else
			@current_user_events = ["No Events Listed"]
		end
	end
	# helper_method :current_user, :current_user_groups

	def current_group
		@current_group = Group.find(session[:group_id]) if session[:group_id]
	end
end
