class OrdersController < ApplicationController
  before_action :authenticate_user!,only:[:create]

  def show
    #@order = Order.find(params[:id])
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save

      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.image = cart_item.product.image
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
      end


      mail_to_customer

      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def mail_to_customer
    if Rails.env == "development"
      OrderMailer.notify_order_placed(@order).deliver!
    end
    # if Rails.env == "development"
        # OrderMailer.notify_order_placed(Order.last).deliver!
    # else
      #send_simple_message
    # end
  end

  def send_simple_message
    RestClient.post "https://api:key-7628122ee4f899ec78714824a0c8678b"\
    "@api.mailgun.net/v3/sandboxa3156e06806a4097a7054dca2c2dccd1.mailgun.org/messages",
    :from => "Mailgun Sandbox <postmaster@sandboxa3156e06806a4097a7054dca2c2dccd1.mailgun.org>",
    :to => "chenyunli <m18301662790@gmail.com>",
    :subject => "Hello chenyunli",
    :text => "Congratulations chenyunli, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
  end

  def go_pay
    payment_method = params[:payment_method]
    @order = Order.find(params[:id])

    if @order.is_paid
      flash[:alert] = "已经支付成功，无需再次支付"
      redirect_to :back
      return
    end

    @order.payment_method = payment_method
    @order.is_paid = true

    if @order.save
      @order.make_payment!

      current_cart.cart_items.destroy_all

      flash[:notice] = "支付成功"
      redirect_to account_orders_path
    else
      flash[:notice] = "支付失败"
      redirect_to :back
    end

  end

  private

  def order_params
    params.require(:order).permit(:billing_name,:billing_address,:shipping_name,:shipping_address)
  end
end
