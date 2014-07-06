require 'spec_helper'

feature "get Signin" do 
	let(:user) { User.new username: 'Jake', password_hash: "12345" }
	let(:input_password) { '12345' }
		scenario "User is properly signed in when proper info is entered" do

			user.password = "12345"
			user.save
			visit root_path
			fill_in "user_username", with: user.username
			fill_in "user_password_hash", with: input_password
			click_button "Submit"
			expect(page).to have_content "Logout"
	end
end
