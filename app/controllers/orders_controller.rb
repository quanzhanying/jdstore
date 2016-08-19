class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
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
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
      end


      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  # def destroy
  #   @order = Order.find_by_token(params[:id])

  #   @order.destroy
  #   redirect_to orders_path,alert: '訂單已刪除'
  # end


  def pay_with_alipay
    @order = Order.find(params[:id])
    @order.make_payment!
    @order.is_paid = true
    @order.save
    flash[:notice] = "支付成功"
    OrderMailer.notify_order_placed(@order).deliver!
    redirect_to :back
  end

  def pay_with_wechat
    @order = Order.find(params[:id])
    @order.make_payment!
    @order.is_paid = true
    @order.save
    flash[:notice] = "支付成功"
    OrderMailer.notify_order_placed(@order).deliver!
    redirect_to :back
  end

  # def pay_with_alipay
  #   @order = Order.find(params[:id])
  #   @product_lists = @order.product_lists
  #   if @order.is_paid == 1
  #     flash[:alert] = 'You are already paid.'
  #     render :back
  #   else
  #     @order.is_paid = 1
  #     @order.payment_method = 'alipay'
  #     @order.save
  #     render 'orders/alipay'
  #   end
  # end

  # def pay_with_wechat
  #   @order = Order.find(params[:id])
  #   @product_lists = @order.product_lists
  #   @order.is_paid = 1
  #   @order.payment_method = 'wechat'
  #   @order.save
  #   render 'orders/wechat'
  # end


  def ship
    @order = Order.find(params[:id])
    @order.ship!
    # OrderMailer.ship(@order).deliver!
    @order.save
    flash[:notice] = "已出貨"
    redirect_to :back
  end

  def deliver
    @order = Order.find(params[:id])
    @order.deliver!
    @order.save
    redirect_to :back
  end

  def  return_good
    @order = Order.find(params[:id])
    @order.return_good!
    @order.save
    redirect_to :back
  end


  def apply_to_cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    OrderMailer.apply_cancel(@order).deliver!
    @order.save
    flash[:notice] = "已提交申请"
    redirect_to :back
  end


  def return_good
    @order = Order.find(params[:id])
    @order.return_good!
    OrderMailer.return_good(@order).deliver!
    @order.save
    flash[:notice] = "已申請退貨"
    redirect_to :back
  end


  def destroy
    @order = Order.find(params[:id])

    @order.destroy
    redirect_to orders_path,alert: '訂單已刪除'
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
