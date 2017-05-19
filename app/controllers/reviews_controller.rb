class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id
    if @review.save
      redirect_to @product
    else
      flash[:warning] = "你的评论没填写内容耶！"
      redirect_to @product
    end
  end


  private

  def set_product
      @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:comment, :user_id, :product_id)
  end

end
