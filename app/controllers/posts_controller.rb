class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destory]
  # before action sets the varaible set post as an action for the following actions

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your post couldn't be created! Please try again."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to(post_path(@post))
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(param[:id])
  end

end
