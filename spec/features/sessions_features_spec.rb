require 'spec_helper'

# feature "get Signin" do 
# 	let(:user) { User.new username: 'Jake', password_hash: "12345", user_email: "example@gmail.com", user_zipcode: 12345 }
# 	let(:input_password) { '12345' }
# 		scenario "User is properly signed in when proper info is entered" do

# 			user.password = "12345"
# 			user.save
# 			current_user = user
# 			current_user.user_steam_id = '392738423984'
# 			visit root_path
# 			fill_in "user_username", with: user.username
# 			fill_in "user_password_hash", with: input_password
# 			click_button "Submit"
# 			expect(page).to have_content "test text"
# 	end
# end

#replace with better test
# feature 'change password', js: true do
# 		scenario "User's password is properly changed with valid input" do
# 			@user = User.create username: 'Jake', password_hash: "12345"
# 			visit new_password_path
# 			fill_in "user_password_hash", with: "123"
# 			fill_in "user_confirm_pw", with: "123"
# 			click_button "Submit"
# 			expect(user.password).to eq(BCrypt::Password.create("123"))
# 		end
# end