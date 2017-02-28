class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to product_path(@product), notice: 'Review was successfully created.'
    else
      redirect_to product_path(@product), notice: 'You have to write some words.'
    end
  end


  def destroy
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product), alert: "You have deleted the review successfully"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end



end
