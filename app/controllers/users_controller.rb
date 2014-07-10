class UsersController < ApplicationController

  def index
    session[:group_id] = nil
    # session[:id] = nil
    @games = current_user.games if current_user
  end

  def show
    @user = User.find(params[:id])
    session[:group_id] = nil
    u_games = UserGame.where(user_id: @user.id)
    @games = []
    if u_games
      u_games.each do |game|
        result = Game.find(game.game_id)
        @games << result if result
      end
    end
    @groups = @user.groups
    @events = UserEvent.where(user_id: @user.id)

      # @user_ajax << @user
      # @user_ajax << @games
      # @user_ajax << @groups
      # @user_ajax << @events
      
      # format.json { render json: @post.to_json(:include => :comments) }


      p "%" * 200
      p "user_ajax"
      p @user_ajax
      
    if request.xhr? == 0
      p "()()"*100
      p "in xhr controller"
      respond_to do |format|
        p "format json"
        format.json {render json: @user.to_json(include: [:games, :groups, :events]) }
      end
    else
      p "@"*100
      p "in else render show"
      render :show
    end
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if params[:user][:password_hash] == params[:user][:confirm_pw]
      @user.password = params[:user][:password_hash]
      @user.login = params[:user][:username]

      if @user.save
        session[:id] = @user.id
        flash[:notice] = "User has been successfully created!"
        redirect_to user_path @user
      else
        flash[:error] = "Something went wrong!"
        render '/users/new'
      end

    else
      flash[:error] = "Username and Password do not match!"
      render '/users/new'
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    real_user = current_user
    if real_user && @user.id != current_user.id
      real_user.friends << @user
      redirect_to user_path(real_user)
    else
      if @user.update_attributes params[:user]
        flash[:notice] = "User has been successfully updated!"
        redirect_to user_path @user
      else
        flash[:error] = "Something went wrong!"
        render 'users/edit'
      end
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy

    redirect_to users_path
  end

  def new_password
    @user = current_user
    render partial: "users/changepw"
  end

  def update_password
    @user = current_user
    if params[:user][:password_hash] == params[:user][:confirm_pw]
      @user.password = params[:user][:password_hash]
      @user.save
      redirect_to user_path(@user)
    else
      redirect_to new_password_path
    end
  end

  def show_groups
    @groups = Group.all
  end

  def addgame
    @user = current_user
    @game = Game.find params[:id]
    @user.games << @game

    redirect_to user_path(current_user)
  end
end
