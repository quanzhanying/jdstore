class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save

      current_cart.cart_items.each do |cart_item|
        item_list = ItemList.new
        item_list.order = @order
        item_list.item_name = cart_item.item.title
        item_list.item_price = cart_item.item.price
        item_list.quantity = cart_item.storage
        item_list.save
      end

      @cart = current_cart
      @cart.destroy

      @cart_items = CartItem.where(:cart_id => @cart.id)
      @cart_items.each do |d|
        d.destroy
      end


      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @item_lists = @order.item_lists
  end

  def pay_with_wechat
    @order = Order.find(params[:id])
    @order.wechat!
    @order.make_payment!

    redirect_to :back
  end


  def pay_with_alipay
    @order = Order.find(params[:id])
    @order.alipay!
    @order.make_payment!

    redirect_to :back
  end



  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :is_paid, :payment_method)
  end

end
