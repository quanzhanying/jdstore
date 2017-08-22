class ProductsController < ApplicationController
 def index
   @products = Product.all
 end

 def show
   @product = Product.find_by_friendly_id!(params[:id])
 end

 def add_to_cart
   @product = Product.find(params[:id])

   if !current_cart.products.include?(@product)

     flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
   else
     flash[:warning] = "你的購物車內有此物品"
   end


   current_cart.add_product_to_cart(@product)
   flash[:notice] = "成功加入購物車"
   redirect_to :back
 end
end
