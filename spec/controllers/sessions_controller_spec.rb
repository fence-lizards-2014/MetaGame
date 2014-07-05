require 'spec_helper'

describe SessionsController, js: true do 
let!(:user) {FactoryGirl.create(:user)}
	context "Authentication" do
		xit "/get signin should render the signin template" do 
			visit '/signin'
			p response
			expect(response).to render_template(:signin)
		end

		xit "/post signin_attempt should redirect to user profile if password is correct" do
			post sign_in_attempt_path
			expect(response).to render_template(:show)
		end
	end
end

# logout GET    /logout(.:format)              sessions#logout
#      steam_auth POST   /auth/steam/callback(.:format) sessions#auth_callback
#          signin GET    /signin(.:format)              sessions#signin
# sign_in_attempt POST   /sessions(.:format)            sessions#signin_attempt