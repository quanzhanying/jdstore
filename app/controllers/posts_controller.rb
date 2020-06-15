class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


  private

  def post_params
    params.require(params[:id]).permit(:title, :description, :author, :source, :category_id, :image)
  end
end
