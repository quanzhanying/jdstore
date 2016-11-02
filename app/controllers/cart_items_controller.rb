class CartItemsController < ApplicationController

  def show
    @cart_item = CartItem.find(params[:id])
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def plus
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity < @cart_item.product.quantity
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to :back
    else
      flash[:alert] = "全部都给你了,没有了真的没有了"
      redirect_to :back
    end
  end

  def minus
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity -= 1
    if @cart_item.quantity <0
    else
    @cart_item.save
    end
    redirect_to :back
  end

end
