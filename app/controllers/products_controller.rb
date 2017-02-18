class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    bi=false
    current_cart.cart_items.each do |cart_item|
      if cart_item.product_id == @product.id
        bi=true
      end
    end

    if bi == false
        if @product.quantity != 0
          current_cart.add_product_to_cart(@product)
          flash[:notice] = "成功加入购物车！"
          redirect_to :back
        else
          flash[:warning] = "对不起，该商品已经没有库存了。"
          redirect_to :back
        end
    else
        flash[:warning] = "该商品已经加入购物车了。"
        redirect_to :back
    end

  end



end
