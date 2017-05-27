class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  def index
    if params[:category].blank?
      @posts = Post.all.recent
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).recent
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    @post.category_id = params[:category_id]
    if @post.save

      redirect_to admin_posts_path,notice:"创建成功！"
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "确定删除吗"
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :author, :source, :category_id)
  end
end
