class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @order = Order.find(params[:order_id])
    @post = Post.new
  end

  def create
    @order = Order.find(params[:order_id])
    @post = Post.new(post_params)
    @post.order = @order
    @post.user = current_user

    if @post.save
      redirect_to order_path(@order.token)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
  
end
