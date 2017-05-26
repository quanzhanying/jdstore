class ProductsController < ApplicationController

  before_action :authenticate_user!, except:[:index, :show,:add_to_cart, :accessory, :shoes]

  def index
        @q = Product.ransack(params[:q])
        @products = @q.result(distinct: true)
        if params[:favorite] == "yes"
           @products = current_user.products
        end
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
       flash[:warning] = "你的购物车内已有此商品"
    end
    redirect_to :back
  end

  def add_to_favorite
      @product = Product.find(params[:id])
      @product.users << current_user
      @product.save
      redirect_to :back, notice:"成功加入收藏!"
  end

  def quit_favorite
      @product = Product.find(params[:id])
      @product.users.delete(current_user)
      @product.save
      redirect_to :back, alert: "成功取消收藏!"
  end


  def accessory
    @products = Product.where(:category => "accessory").paginate(:page => params[:page], :per_page => 5)
  end

  def shoes
    @products = Product.where(:category => "shoes").paginate(:page => params[:page], :per_page => 5)
  end


  def pay_now
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
    else
      flash[:warning] = "购物车已有此商品!"
    end
    redirect_to carts_path
  end


end
