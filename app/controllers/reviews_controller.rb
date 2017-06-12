class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @product = Product.find_by_friendly_id!(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: 'Review was created successfully'
    else
      redirect_to product_path(@product), alert: 'Please fill in review'
    end
  end

  def destroy
    @product = Product.find_by_friendly_id!(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product), alert: "Review deleted successfully"
  end

  private
  def review_params
    params.require(:review).permit(:body)
  end
end
