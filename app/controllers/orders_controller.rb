class OrdersController < ApplicationController

  def create
    @order =  Order.new(order_params)
    @order.user_id = current_user.id
    @order.total = current_cart.cart_total_price
    if @order.save
      redirect_to order_path(@order)
    else
      redirect_to :back
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address,);
  end
end
