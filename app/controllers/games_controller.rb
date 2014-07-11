class GamesController < ApplicationController

  GAME_NOT_FOUND = "No Game Found"

  def index
    @games = Game.all
  end

  def show
    @game = Game.find params[:id]  
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
    @games = Game.search_games params['search']

    if @games
      @games.sort! { |game1, game2| game1.game_name <=> game2.game_name }
    end
    
    render 'games/search'

  end

  def confirm
    game = Game.find params[:id]
    redirect_to game_path(game)
  end

  def addgame
    game = Game.find params[:id]
    if session[:group_id] == nil
      current_user.games << game
      redirect_to user_path current_user
    else
      current_group.games << game
      redirect_to group_path current_group
    end
  end
end

