require 'spec_helper'

describe SessionsController do 
	context "Authentication" do
		it "/get signin should render the signin template" do 
			get :signin
			expect(response).to render_template(:signin)
		end

		it "should redirect to root path on logout" do
			session[:id] = 1
			get :logout
			expect(response).to redirect_to root_path
		end

		it "should clear session id on logout" do
			session[:id] = 1
			get :logout
			expect(session[:id]).to eq nil
		end
	end
end

# $2a$10$0LW.DOEs59uavBUVe2N1jOl5oCOQwiANEUE0nfQxfbPIS.lJR4Aye

# logout GET    /logout(.:format)              sessions#logout
#      steam_auth POST   /auth/steam/callback(.:format) sessions#auth_callback
#          signin GET    /signin(.:format)              sessions#signin
# sign_in_attempt POST   /sessions(.:format)            sessions#signin_attempt