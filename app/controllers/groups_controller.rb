class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find params[:id]
    session[:group_id] = @group.id
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find params[:id]
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

  def add_user
    group = Group.find(params[:id])
    user = User.find(session[:id])
    group.users << user
    user.groups << group
    group.save
    user.save

    redirect_to "/users"
  end

  def remove_user
    p "*" * 300
    user = User.find(session[:id])
    group = Group.find(params[:id])
    group.users.delete(user)
    user.groups.delete(group)
    redirect_to root_path
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
end
