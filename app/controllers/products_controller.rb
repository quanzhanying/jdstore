class ProductsController < ApplicationController

  respond_to :js

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
     @product.quantity -= @product.buying_quantity
     @product.buying_quantity = 1
     @product.save
     flash[:notice] = "你已成功将 《#{@product.title}》 加入购物车"
   else
     flash[:warning] = "你的购物车内已有 《#{@product.title}》"
   end
    redirect_to :back
    # respond_to do |format|
    #   format.js   { render :layout => false }
    # end
  end

  def add_buying_quantity
    @product = Product.find(params[:id])
    if @product.buying_quantity <= @product.quantity
      @product.buying_quantity +=1
      @product.save
      # redirect_to :back
      respond_to do |format|
        format.js   { render :layout => false }
      end
    end
  end

  def remove_buying_quantity
    @product = Product.find(params[:id])
    if @product.buying_quantity > 1
      @product.buying_quantity -= 1
      @product.save
      # redirect_to :back
      respond_to do |format|
        format.js   { render :layout => false }
      end
    end
end
  end
