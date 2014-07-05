module UsersHelper
	def current_user
		if session[:id]
			User.find(session[:id])
		else
			false
		end
	end
end
