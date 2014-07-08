class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    session[:group_id] = nil
    @user = current_user
    @games = @user.games if @user
    render "users/index"
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    session[:group_id] = nil
    @games = @user.games
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    # CR Use has_secure password
    if params[:user][:password_hash] == params[:user][:confirm_pw]
      @user.password = params[:user][:password_hash]

      respond_to do |format|
        if @user.save
          session[:id] = @user.id
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Username and Password do not match!"
      render '/users/new'
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    #add password encryption when updating
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def addgame
    # CR current_user
    @game = Game.find params[:id]
    current_user.games << @game
    redirect_to user_path(current_user)
  end
end
