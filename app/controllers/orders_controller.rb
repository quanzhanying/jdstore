class OrdersController < ApplicationController



  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price


    if @order.save!

    current_cart.cart_items.each do |cart_item|
      product_list = ProductList.new
      product_list.order = @order
      product_list.product_name = cart_item.product.title
      product_list.product_price = cart_item.product.price
      product_list.purchase_quantity = cart_item.product.quantity
      product_list.save
    end
      current_cart.destroy
      OrderMailer.notify_order_placed(@order).deliver!
      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.pay!
    @order.set_payment_with!("wechat")
    @order.make_payment!


    redirect_to :back,notice: "貌似成功用微信付款了，付了我也不发货。"
  end

  def pay_with_alipay
  @order = Order.find_by_token(params[:id])
  @order.pay!
  @order.set_payment_with!("alipay")
  @order.make_payment!

  redirect_to :back,notice: "貌似成功用支付宝付款了，付了也不发货。"
end



  private

  def order_params
    params.require(:order).permit(:bill_name, :bill_address, :ship_name,:ship_address)
  end

end
