class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index

    @groups = Group.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @post = Post.new
    @group = Group.find(params[:id])
    @poster = current_user
    @posts = @group.posts if @group.posts
    session[:group_id] = @group.id
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end

  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  #
  def create
    @group = Group.new(params[:group])
    current_user
    respond_to do |format|
      if @group.save
        # add cu to group as admin upon group save.
        # add group to cu groups
        @group.users << @current_user
        current_user_groups << @group
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
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

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
end
