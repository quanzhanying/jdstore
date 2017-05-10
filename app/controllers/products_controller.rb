class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if @product.quantity == 0
      flash[:warning] = "此商品暂时没有库存哦"
    else
      if current_cart.cart_items.find_by(product_id: @product)
        flash[:warning] = "此商品已在购物车中"
      else
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "成功加入购物车"
      end
    end

    redirect_to :back
  end

  def remove_from_cart
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @cart_item.destroy

    flash[:notice] = "成功移除商品"
    redirect_to :back
  end

end
