class PostsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to :back
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
