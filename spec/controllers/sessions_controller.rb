require 'spec_helper'

describe SessionsController do 
	context "Authentication" do
		it "/get signin should render the signin template" do 
			get signin_path
			expect(response).to render_template("sessions/signin")
		end
	end
end

# logout GET    /logout(.:format)              sessions#logout
#      steam_auth POST   /auth/steam/callback(.:format) sessions#auth_callback
#          signin GET    /signin(.:format)              sessions#signin
# sign_in_attempt POST   /sessions(.:format)            sessions#signin_attempt