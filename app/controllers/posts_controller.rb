class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @group = current_group
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    if @post.save && current_group.users.include?(current_user)
      current_group.posts << @post
      flash[:notice] = 'Your post has been successfully created!'
      redirect_to group_path(current_group)
    else
      flash[:notice] = "Post content cannot be blank"
      redirect_to group_path(current_group)
    end
  end

  def update
    @post = Post.find params[:id]

    if @post.update_attributes params[:post]
      flash[:notice] = 'Your post has been successfully updated!'
      redirect_to posts_path
    else
      flash[:notice] = 'Something went wrong!'
      render 'posts/edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
end