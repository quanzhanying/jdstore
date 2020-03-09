class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to product_path(@product), notice: '評論發布成功。'
    else
      redirect_to product_path(@product), notice: '請輸入您的評論。'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product), alert: "成功刪除評論。"
  end

  private
  def review_params
    params.require(:review).permit(:body)
  end
end
