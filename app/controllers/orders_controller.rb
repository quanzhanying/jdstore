class OrdersController < ApplicationController
  def created
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price
    if @order.save
      redirect_to order_path(@order)
    else
      render "carts/checkout"
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order.save

  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:total, :user_id, :billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
