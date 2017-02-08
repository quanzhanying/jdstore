class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
       if @product.quantity > 0
         current_cart.add_product_to_cart(@product)
         flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
       else
         flash[:alert]='商品已售完,无法购买！'
       end

    else
       flash[:warning] = "你的购物车内已有此物品"
    end
      redirect_to :back
  end


end
