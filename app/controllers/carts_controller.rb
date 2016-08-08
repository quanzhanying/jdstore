class CartsController < ApplicationController
  # 从报错信息来看，我要想创建订单的话好像要在这里写上create方法

  def destroy
    current_cart.cart_items.destroy_all
    redirect_to :back, alert: "Your cart has been cleared!"
  end

  def delete_item
    CartItem.find(params[:id]).destroy # 如果我要删item，还是用最基本的找item的id的方法
    # current_cart.cart_items.first.destroy
    redirect_to :back, alert: "This item has gone away!"
  end

  def change_quantity # 这是一个post的方法，在cart的index捕捉到item，然后创建一定数量的items
    @ci = CartItem.find(params[:id])
    if @ci.update(quantity_params)
      flash[:notice] = "#{@ci.product.title} quantity has changed"
    end
    redirect_to :back
  end

  def quantity_params
    params.require(:cart_item).permit(:quantity)
  end
  # def clear_all
  #   cart.cart_items.destroy_all
  #   redirect_to :back, alert: "Your cart has been cleared!"
  # end

end
