require 'spec_helper'

describe SessionsController do 
let!(:user) {FactoryGirl.create(:user)}
	context "Authentication" do
		it "/get signin should render the signin template" do 
			
			
			expect(response).to render_template(:signin)
		end

		it "/post signin_attempt should redirect to user profile if password is correct" do
			params = {}
			params[:user][:password_hash] = user.password
			post sign_in_attempt_path
			expect(response).to render_template(:show)
		end
	end
end

# logout GET    /logout(.:format)              sessions#logout
#      steam_auth POST   /auth/steam/callback(.:format) sessions#auth_callback
#          signin GET    /signin(.:format)              sessions#signin
# sign_in_attempt POST   /sessions(.:format)            sessions#signin_attempt