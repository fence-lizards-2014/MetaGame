class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
		if session[:id]
			# User.find(session[:id])
			@current_user ||= User.find_by_id(session[:id])

		else
			false
		end
	end
end
