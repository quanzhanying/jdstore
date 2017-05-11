class CartItemsController < ApplicationController
  def destroy
    cart_item = current_item.cart_items.find(params[:id])
    product = cart_item.product
    cart_item.destroy
    redirect_to :back, warning: "成功将#{product.title}从购物车删除"
  end

  def increase
    cart_item = current_cart.cart_items.find(params[:id])
    unless cart_item.product.quantity >= 1
      redirect_to :back, alert: '已售罄，无法增加'
      return
    end
    cart_item.quantity += 1
    cart_item.product.quantity -= 1
    cart_item.save
    cart_item.product.save
    redirect_to :back
  end

  def decrease
    cart_item = current_cart.cart_items.find(params[:id])
    cart_item.quantity -= 1
    cart_item.product.quantity += 1
    cart_item.save
    cart_item.product.save
    if cart_item.quantity <= 0
      current_cart.cart_items.delete(cart_item)
    end
    redirect_to :back
  end

end
