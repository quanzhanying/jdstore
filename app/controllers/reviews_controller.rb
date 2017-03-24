class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :find_product_by_id,only:[:create,:destroy]
  def create

    @review = @product.reviews.new(review_params)
    @review.user = current_user

   if @review.save
  redirect_to product_path(@product), notice: 'Review was successfully created.'
else
  redirect_to product_path(@product), notice: 'You have to write some words.'
end
  end

  def destroy

    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product), alert: "You have deleted the review successfully"
  end

  private
  def review_params
    params.require(:review).permit(:body)
  end

  def find_product_by_id
    @product = Product.find(params[:product_id])
  end
end
