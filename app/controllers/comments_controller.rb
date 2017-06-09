class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create,:new]

  def new
    @product = Product.find(params[:product_id])
    @comment = Comment.new
  end
  
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    # @comment = Comments.new(comment_params)
    # @comment.product = @product
    @comment.user = current_user

    if @comment.save
      redirect_to product_path(@product), notice: "已评论"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
