require_relative '../models/steam_adapter'
module UsersHelper
<<<<<<< HEAD
	def current_user
		if session[:id]
			User.find(session[:id])
		else
			false
		end
=======

	def self.check_steam_id(user, steam_id)
		if user.user_steam_id != steam_id
      user.update_attributes user_steam_id: steam_id
    end
>>>>>>> 631bcd6a25614d9289e927b7a56383c356f4e2de
	end
end
