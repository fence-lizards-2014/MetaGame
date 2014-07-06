
class SessionsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :auth_callback

	def auth_callback
		user = User.find session[:id]
	  auth = request.env['omniauth.auth']
	  session[:current_user] = { :nickname => auth.info['nickname'],
	                                        :image => auth.info['image'],
	                                        :uid => auth.uid }
	  redirect_to user_path(user)
	end


	def logout
		session[:current_user] = nil
		session[:id] = nil
		redirect_to root_path
	end

	def signin
		render partial: "/sessions/signin"
	end

	def sign_in_attempt
		@user = User.find_by_username(params[:user][:username])
		if @user.password == params[:user][:password_hash]
			session[:id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to signin_path, flash: { notice: "Invalid Email-Password combination" }
		end
	end
end