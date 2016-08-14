class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price #total_price是cart的model中的方法，返回值为总价

    if @order.save
      save_product_list
      OrderMailer.notify_order_placed(@order).deliver!
      redirect_to order_path(@order.token)
    else
      render 'carts/checkout' # 调用carts下面的checkout页面，调用template
    end

  end

  def save_product_list
    current_cart.cart_items.each do |cart_item|
      product_list = ProductList.new
      product_list.order = @order # 确定了show里面的@product_lists
      product_list.product_name = cart_item.product.title
      product_list.product_price = cart_item.product.money
      product_list.quantity = cart_item.quantity
      product_list.save
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

# use 2 action to manage alipay and wechat respectively
  # def pay_with_alipay
  #   @order = Order.find(params[:id])
  #   if @order.is_paid == true
  #     redirect_to :back, alert: "Already Paid!"
  #     return # break the action to prevent payment
  #   end
  #   @order.is_paid = true
  #   @order.payment_method = "Alipay"
  #   if @order.save
  #     redirect_to account_orders_path, notice: "You have paid an order just now!"
  #   else
  #     redirect_to :back, alert: "Something went wrong with your payment!"
  #   end
  # end
  #
  # def pay_with_wechat
  #   @order = Order.find(params[:id])
  #   if @order.is_paid == true
  #     redirect_to :back, alert: "Already Paid!"
  #     return
  #   end
  #   @order.is_paid = true
  #   @order.payment_method = "Wechat"
  #   if @order.save
  #     redirect_to account_orders_path, notice: "You have paid an order just now!"
  #   else
  #     redirect_to :back, alert: "Something went wrong with your payment!"
  #   end
  # end
# end payment management

  def pay_with_alipay_or_wechat
    @order = Order.find(params[:id])
    if @order.is_paid
      redirect_to :back, alert: "You have paid order No.#{@order.id}"
      return
    end
    @order.is_paid = true
    @order.payment_method = params[:payment_method] # 如果我把这个参数写在permit里面，那会有问题吧
    if @order.save
    @order.make_payment!
    redirect_to account_orders_path, notice: "You have paid order No.#{@order.id} just now"
    end
  end

  def apply_cancell
    @order = Order.find(params[:id]) # Will it cause to cancell other's orders?
    @order.apply_cancell!
    OrderMailer.notify_apply_cancell(@order).deliver!
    flash[:notice] = "Applied! We have informed the administrator!"
    redirect_to :back
  end


  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
