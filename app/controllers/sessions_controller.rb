
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
		render :signin
	end

	def sign_in_attempt
		p "*" * 250
		p params
		@user = User.find_by_username(params[:user][:username])
		if @user.password == params[:user][:password_hash]
			session[:id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to sign_in_path, flash: { notice: "Your password was incorrect!" }
		end
	end
end