class ProductsController < ApplicationController
  def index
  @products = Product.all.order("position ASC")
 end

  def show
   @product = Product.find(params[:id])
 end

 def add_to_cart

  @product=Product.find(params[:id])

   if !current_cart.products.include?(@product)
   current_cart.add_product_to_cart(@product)
    flash[:notice] = "成功将 #{@product.title} 加入购物车"

   else
     current_cart.add_units_to_product(@product)
    @cart_items=current_cart.cart_items.find_by(product_id: @product.id)
    flash[:warning] = "你的购物车内已有此物品,数量#{@cart_items.quantity}"
  end
  redirect_to :back
  end


end
