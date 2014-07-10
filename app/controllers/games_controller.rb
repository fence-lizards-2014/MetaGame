class GamesController < ApplicationController

  GAME_NOT_FOUND = "No Game Found"

  def index
    @games = Game.all
  end

  def show
    @game = Game.find params[:id]
    @returned_game = GiantBombAdapter.new(@game.game_name).search.parsed_response["results"][0]["description"]    
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new params[:game]
    if @game.save
      flash[:notice] = "Game was successfully created!"
      redirect_to game_path @game
    else
      flash[:error] = "Please enter a valid game!"
      render 'games/new'
    end

  end

  def edit
    @game = Game.find params[:id] 
  end

  def update
    @game = Game.find params[:id]

    if @game.update_attributes params[:game]
      flash[:notice] = "Game has been successfully updated!"
      redirect_to game_path @game
    else
      flash[:error] = "Something went wrong!"
      render 'games/edit'
    end
  end

  def destroy
    @game = Game.find params[:id]
    @game.destroy

    redirect_to games_path
  end

  def search
    @game = Game.search_games params['search']
    p @game


    redirect_to root_path
    # if @game == nil 
    #   redirect_to user_path(current_user)
    # end
    # if session[:group_id]
    #   @group = Group.find session[:group_id]
    #   @group.games << @game
    #   redirect_to group_path session[:group_id]
    # else
    #   @user = User.find session[:id]
    #   @user.games << @game
    #   redirect_to games_path
    # end
  end

  def confirm_search

  end
end

