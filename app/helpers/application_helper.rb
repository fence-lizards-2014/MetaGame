# CR use helper_method : on appliction controller
module ApplicationHelper
	 def current_user
		if session[:id]
			User.find(session[:id])
		else
			false
		end
	end
end
