
class SessionsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :auth_callback

	def auth_callback
	  auth = request.env['omniauth.auth']
	  session[:current_user] = { :nickname => auth.info['nickname'],
	                                        :image => auth.info['image'],
	                                        :uid => auth.uid }
	  redirect_to root_path
	end

	def destroy
		session[:current_user] = nil
		redirect_to root_path
	end
end