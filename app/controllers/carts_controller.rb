class CartsController < ApplicationController

  def destroy


  end

  def delete_cart_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:alert] = "Delete Succeeded"
    redirect_to :back

  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to :back

  end

  def plus_one_to_item
    @cart_item = CartItem.find(params[:id])

    @product = Product.find(@cart_item[:product_id])
    if @cart_item.quantity < @product.quantity

      @cart_item.quantity += 1
      @cart_item.save
    end
    redirect_to :back

  end

  def minus_one_to_item
    @cart_item = CartItem.find(params[:id])

    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
      @cart_item.save
    end
    redirect_to :back

  end

end
