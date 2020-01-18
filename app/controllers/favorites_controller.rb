class FavoritesController < ApplicationController

  def index
   @products = current_user.favorite_products
  end

  def unfavorite
    @product = Product.find(params[:id])
    current_user.favorite_products.delete(@product)
    flash[:notice] = "已取消珍藏此商品！"
    redirect_to :back
  end

    private
    def find_product
      @product = Product.find params[:product_id]
    end

end
