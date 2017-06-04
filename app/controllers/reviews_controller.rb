class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def index
    if !params[:min_id].blank?
      #min_id = params[:min_id]
      #if !@min_id_old.blank? && min_id != @min_id_old
      @product = Product.find(params[:product_id])
      @reviews = @product.reviews.where("id < ?",params[:min_id]).order("id desc").limit(20)
      respond_to do |format|
          format.html
          format.js
        end
        #@min_id_old = min_id
      #end
    end
  end
  def like
    @review = Review.find(params[:id])
    if !current_user.is_like_of?(@review)
       current_user.like!(@review)
       jq = "$('#like-item-"+@review.id.to_s+"').attr('href','"+unlike_product_review_path(params[:product_id],@review)+"').children('i').removeClass('fa-thumbs-o-up').addClass('fa-thumbs-up').html(' "+@review.likes.count.to_s+"');"
       render js: jq
    end
  end
  def unlike
    @review = Review.find(params[:id])
    if current_user.is_like_of?(@review)
       current_user.unlike!(@review)
       jq = "$('#like-item-"+@review.id.to_s+"').attr('href','"+like_product_review_path(params[:product_id],@review)+"').children('i').removeClass('fa-thumbs-up').addClass('fa-thumbs-o-up').html(' "+@review.likes.count.to_s+"');"
       render js: jq
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
    params.require(:review).permit(:body,:score)
  end
end
