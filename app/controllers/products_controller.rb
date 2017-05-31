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
     current_cart.add_product_to_cart(@product)
     flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
   else
     flash[:warning] = "你的购物车内已有此物品"
   end
    redirect_to :back
  end

  def add_buying_quantity
    if @product.buying_quantity <= @product.quantity
      binding.pry
      @product.buying_quantity +=1
      @product.save
      redirect_to :back

    end
  end

  def remove_buying_quantity
    if @product.buying_quantity > 1
      @product.buying_quantity -= 1
      @product.save
      redirect_to :back
    end
  end


end
