class CartsController < ApplicationController

  def index
  end

  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])

    @cart_item.destroy
    flash[:notice] = "已从购物车中删除！"
    redirect_to :back
  end

  def empty
    current_cart.cart_items.destroy_all

    flash[:notice] = "已经清空购物车！"
    redirect_to :back
  end

  def up_quantity
    @cart_item = current_cart.cart_items.find(params[:id])
    @product = @cart_item.product

    if @cart_item.quantity == @product.quantity
      flash[:warning] = "没有库存了。"
      redirect_to :back
    else
      @cart_item.quantity = @cart_item.quantity + 1
      @cart_item.save
      redirect_to :back
    end
  end

  def down_quantity
    @cart_item = current_cart.cart_items.find(params[:id])
    @product = @cart_item.product

    if @cart_item.quantity != 1
      @cart_item.quantity = @cart_item.quantity - 1
      @cart_item.save
      redirect_to :back
    end
  end

end
