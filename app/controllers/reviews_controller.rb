class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def index
    if !params[:min_id].blank?
      @product = Product.find(params[:product_id])
    @reviews = @product.reviews.where("id > ?",params[:min_id]).order("id desc").limit(5)
    respond_to do |format|
        format.html
        format.js
      end
    end
  end
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
    redirect_to product_path(@product), alert: "You have deleted the review successfully"
  end

  private
  def review_params
    params.require(:review).permit(:body)
  end
end
