class ProductsController < ApplicationController
  def index
   @products = Product.all
 end

 def show
   @product = Product.find(params[:id])
 end

 def add_to_cart
   @product = Product.find(params[:id])
   if !current_cart.product.include?(@produc)
     current_cart.add_product_to_cart(@product)
     flash[:notice] = "你已成功将 #{@produc.title} 加入购物车"
   else
     flash[:warning] = "你的购物车内已有此物品"
   end
   redirect_to :back
 end

 private

   def product_params
     params.require(:product).permit(:title, :description, :price, :quantity, :image)
   end

end
