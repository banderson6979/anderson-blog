class PostsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show]

  # Index action to render all posts.
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # New action for creating posts.
  def new
    @post = Post.new
  end

  # Creat action saves the post into the database
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end

  # Update action updates the post with new data
  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to post_path(@posts)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  # The show action renders the individual post after retrieving the post id
  def show
  end

  # The destory action removes the post permanetly from the database
  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
