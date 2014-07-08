class ApplicationController < ActionController::Base
  protect_from_forgery
  # CR refactor to one line
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
	# CR
	# helper_method :current_user
end
