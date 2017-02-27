class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: 'Review was successfully created.'
    else
      redirect_to product_path(@product), notice: 'You have to write some words.'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product), alert: 'You have deleted the review successfully'
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :body, :user_id)
  end
end
