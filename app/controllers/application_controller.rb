class ApplicationController < ActionController::Base
  protect_from_forgery
  
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

	helper_method :current_user, :current_user_groups
end
