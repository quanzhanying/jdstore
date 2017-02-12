class ProductsController < ApplicationController
  def index
    @products = case params[:order]
    when 'by_shirt'
      Product.where(is_shirt: true).order('shirt_name DESC')
    when 'by_sweatre'
      Product.where(is_sweatre: true).order('sweatre_name DESC')
    when 'by_jean'
      Product.where(is_jean: true).order('jean_name DESC')
    when 'by_jacket'
      Product.where(is_jacket: true).order('jacket_name DESC')
    else
      Product.order('created_at DESC')
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
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

end
