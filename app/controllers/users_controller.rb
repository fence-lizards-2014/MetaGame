class UsersController < ApplicationController

  def index
    session[:group_id] = nil
    @games = current_user.games if current_user
  end

  def show
    @user = User.find params[:id]
    if current_user.id == @user.id
      session[:group_id] = nil
      @games = @user.games
    else
      render :error
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    p "*" * 75
    p params
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

    if @user.update_attributes params[:user]
      flash[:notice] = "User has been successfully updated!"
      redirect_to user_path @user
    else
      flash[:error] = "Something went wrong!"
      render 'users/edit'
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

  def addgame
    current_user
    @game = Game.find params[:id]
    @current_user.games << @game

    redirect_to user_path(current_user)
  end
end
