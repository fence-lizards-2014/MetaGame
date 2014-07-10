class GroupsController < ApplicationController

  def index
    if current_user
      @user_games = current_user.games
      @my_groups = current_user.groups
    end
    @news_groups = []
    all_groups = Group.all 
    all_groups.each do |group|
      @user_games.each do |game|
        if group.games.include?(game) && !current_user.groups.include?(group)
          @news_groups << group 
        end
      end
    end
  end

  def show
    @post = Post.new
    @group = Group.find(params[:id])
    @poster = current_user
    @posts = @group.posts if @group.posts
    @users = @group.users if @group.users
    session[:group_id] = @group.id
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new params[:group]
    current_user
    if @group.save
      # add cu to group as admin upon group save.
      # add group to cu groups

      @group.users << @current_user

      current_user_groups << @group

      flash[:notice] = 'Group was successfully created.'
      redirect_to group_path @group
    else
      flash[:error] = 'Something went wrong!'
      render 'groups/new'
    end
  end

  def edit
    @group = Group.find params[:id]
  end

  def update
    @group = Group.find(params[:id])
    
    if @group.update_attributes params[:group]
      flash[:notice] = 'Group was successfully updated!'
      redirect_to group_path @group
    else
      flash[:error] = 'Something went wrong!'
      render 'groups/edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    
    redirect_to groups_path
  end

  def add_user
    group = Group.find params[:id]
    Group.assign_user_to_group group, current_user
   
    redirect_to users_path
  end

  def remove_user
    group = Group.find params[:id]
    Group.remove_user_to_group group, current_user
   
    redirect_to root_path
  end
end
