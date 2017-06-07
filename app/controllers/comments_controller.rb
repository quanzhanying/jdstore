class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to product_path(@product), notice: "已评论"
    else
      redirect_to product_path(@product), notice: "内容不能为空"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
