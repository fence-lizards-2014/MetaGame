
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

<<<<<<< HEAD
	def logout
=======
	def destroy
		session[:current_user] = nil
>>>>>>> 631bcd6a25614d9289e927b7a56383c356f4e2de
		session[:id] = nil
		redirect_to root_path
	end

	def signin
		render :signin
	end

	def signin_attempt
		@user = User.find_by_user_name(params[:user][:user_name])
		if @user.password == params[:user][:password_hash]
			session[:id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to sign_in_path, flash: { notice: "Your password was incorrect!" }
		end
	end
end