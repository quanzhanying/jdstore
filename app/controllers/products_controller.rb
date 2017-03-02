class ProductsController < ApplicationController

  def index
    @products = Product.where(:is_hidden =>false)
    @products_a = Product.where(:zhonglei => 'picao', :is_hidden => false)
    @products_b = Product.where(:zhonglei => 'meishi', :is_hidden => false)
    @products_c = Product.where(:zhonglei => 'yaocai', :is_hidden => false)
    @products_d = Product.where(:zhonglei => 'chongwu', :is_hidden => false)
    @products_e = Product.where(:zhonglei => 'shechipin', :is_hidden => false)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
   @product = Product.find(params[:id])
   if !current_cart.products.include?(@product)
         current_cart.add_product_to_cart(@product)
     flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
   else
     flash[:warning] = "你的购物车内已有此物品"
   end
     redirect_to :back
   end

   def protect_them
     @product = Product.find(params[:id])
     @product.protect_them = true
     @product.save
     redirect_to :back
     flash[:notice] ="test"
end

end
