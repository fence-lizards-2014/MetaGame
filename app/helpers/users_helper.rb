require_relative '../models/steam_adapter'
module UsersHelper

	def self.check_steam_id(user, steam_id)
		if user.user_steam_id != steam_id
      user.update_attributes user_steam_id: steam_id
    end
	end
end
