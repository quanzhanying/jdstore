class ProductsController < ApplicationController


  def index
    @products = case params[:order]
    when 'by_clothes'
      Product.where(is_clothes: true).order('clothes DESC')
    when 'by_living'
      Product.where(is_living: true).order('living DESC')
    when 'by_eating'
      Product.where(is_eating: true).order('eating DESC')
    when 'by_walking'
      Product.where(is_walking: true).order('walking DESC')
    when 'by_bathing'
      Product.where(is_bathing: true).order('bathing DESC')
    when 'by_playing'
      Product.where(is_playing: true).order('clothes DESC')

    else
      Product.order('created_at DESC')
    end

    @q = Product.ransack(params[:q])
        @products = @q.result(distinct: true)
  end


  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
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
end
