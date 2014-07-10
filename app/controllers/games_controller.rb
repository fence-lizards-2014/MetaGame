class GamesController < ApplicationController

  GAME_NOT_FOUND = "No Game Found"

  def index
    @games = Game.all
  end

  def show
    @game = Game.find params[:id]
    p @game
    if @game.game_description 
      current_user.games << @game if @game
      p 'inside the if'
    else
      p 'inside the else'
      if @game.game_steam_appid
        game_steam_appid = @game.game_steam_appid
      end

      @returned_game = GiantBombAdapter.new(@game.game_name).search.parsed_response["results"][0]#["description"]    
      game = Game.create(game_name: @returned_game["name"],
                  game_description: @returned_game["description"],
                  game_img_url: @returned_game['image']["screen_url"],
                  game_icon_url: @returned_game['image']['icon_url'])
      game.update_attributes(game_steam_appid: game_steam_appid)
      @returned_game = @returned_game["description"]
    end
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
    if @games.kind_of?(Array)
      @games.sort! { |game1, game2| game1.game_name <=> game2.game_name }
    end
    
    render 'games/search'

  end

  def confirm
    game = Game.find params[:id]
    redirect_to game_path(game)
  end
end

