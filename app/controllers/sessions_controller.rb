
class SessionsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :auth_callback

	def auth_callback
		user = User.find session[:id]
	  auth = request.env['omniauth.auth']
	  session[:current_user] = {  :nickname => auth.info['nickname'],
																:image => auth.info['image'],
																:uid => auth.uid }
    UsersHelper.check_steam_id(user, session[:current_user][:uid], session[:current_user][:image])
    responses = UsersHelper.make_api_data_calls user.user_steam_id
    GamesHelper.parse_steam_games(responses, user)
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
			redirect_to root_path
		else
			redirect_to signin_path, flash: { notice: "Invalid Email-Password combination" }

		end
	end
end

# {:summary=>{"response"=>{"players"=>[{"steamid"=>"76561198076227521", "communityvisibilitystate"=>3, "profilestate"=>1, "personaname"=>"misterdamon", "lastlogoff"=>1393895917, "profileurl"=>"http://steamcommunity.com/profiles/76561198076227521/", "avatar"=>"http://media.steampowered.com/steamcommunity/public/images/avatars/6f/6f86d94266af8fabd4fbcdbbc35320ef7a65045b.jpg", "avatarmedium"=>"http://media.steampowered.com/steamcommunity/public/images/avatars/6f/6f86d94266af8fabd4fbcdbbc35320ef7a65045b_medium.jpg", "avatarfull"=>"http://media.steampowered.com/steamcommunity/public/images/avatars/6f/6f86d94266af8fabd4fbcdbbc35320ef7a65045b_full.jpg", "personastate"=>0, "realname"=>"Jake", "primaryclanid"=>"103582791429521408", "timecreated"=>1353484059, "personastateflags"=>0, "loccountrycode"=>"US", "locstatecode"=>"CA"}]}}, :games=>{"response"=>{"game_count"=>8, "games"=>[{"appid"=>33900, "name"=>"Arma 2", "playtime_forever"=>0, "img_icon_url"=>"7fd2d12d3f91ee3e69955121323bb89063ea304e", "img_logo_url"=>"9d4d576e4662870232eae35e50b041f93a9a6fa0"}, {"appid"=>33930, "name"=>"Arma 2: Operation Arrowhead", "playtime_forever"=>18, "img_icon_url"=>"32431d84014bf4652181f45bc7c06f1ca3f34363", "img_logo_url"=>"c5eaa05810878e600d117be1c96107a20cd9b262", "has_community_visible_stats"=>true}, {"appid"=>219540, "name"=>"Arma 2: Operation Arrowhead Beta (Obsolete)", "playtime_forever"=>6, "img_icon_url"=>"32431d84014bf4652181f45bc7c06f1ca3f34363", "img_logo_url"=>"c2ea07874fb1a776e4c5bfc659e5f296d656777d"}, {"appid"=>8930, "name"=>"Sid Meier's Civilization V", "playtime_forever"=>33, "img_icon_url"=>"fbe80c4743e226f0bf65559c91b12953d4446808", "img_logo_url"=>"2203f62bd1bdc75c286c13534e50f22e3bd5bb58", "has_community_visible_stats"=>true}, {"appid"=>219640, "name"=>"Chivalry: Medieval Warfare", "playtime_forever"=>5166, "img_icon_url"=>"d4628be29b7e97d93a3404870dfe79642b90b907", "img_logo_url"=>"dd3488ae69593cedf5e73b818ae98e6737aa956c", "has_community_visible_stats"=>true}, {"appid"=>232210, "name"=>"Chivalry: Medieval Warfare Beta", "playtime_forever"=>3, "img_icon_url"=>"d4628be29b7e97d93a3404870dfe79642b90b907", "img_logo_url"=>"dd3488ae69593cedf5e73b818ae98e6737aa956c", "has_community_visible_stats"=>true}, {"appid"=>205790, "name"=>"Dota 2 Test", "playtime_forever"=>0, "img_icon_url"=>"", "img_logo_url"=>""}, {"appid"=>8870, "name"=>"BioShock Infinite", "playtime_forever"=>775, "img_icon_url"=>"4ebaf5f9ee74f50152f7ff361debef7553fa0e4e", "img_logo_url"=>"870bb889e192cf8d31876ed04d329a5d51c6fc2c", "has_community_visible_stats"=>true}]}}}
