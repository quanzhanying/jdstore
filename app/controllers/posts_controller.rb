class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  def show
    @post = Post.find(params[:id])
    if @post.is_hidden
      flash[:warning] = "该主题还没有公开！"
      redirect_to root_path
    end
  end

  def index
    if params[:category].present?
        @posts = Post.published.where(category_id: params[:category]).recent
    else
        @posts = Post.published.recent
    end

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.category_id = params[:category_id]
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.category_id = params[:category_id]
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :description, :contact_email, :is_hidden, :category_id)
  end

end
