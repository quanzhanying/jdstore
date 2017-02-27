class WelcomeController < ApplicationController

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def upvote
    @product = Product.find(params[:id])
    @product.upvote_by current_user
    redirect_to :back
  end


end
