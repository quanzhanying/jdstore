class OrdersController < ApplicationController
  def create
    @order = Order.new
    @address = Address.find(params[:address])
    @order.user = current_user
    @order.shipping_name = @address.name
    @order.shipping_province = ChinaCity.get(@address.province)
    @order.shipping_city = ChinaCity.get(@address.city)
    @order.shipping_district = ChinaCity.get(@address.district)
    @order.shipping_address = @address.addr
    @order.shipping_phone = @address.phone
    if params[:num].blank?
      @order.total = current_cart.total_price
      if @order.save
        current_cart.cart_items.each do |cart_item|
          product_list = ProductList.new
          product_list.order = @order
          product_list.product_id = cart_item.product.id
          product_list.product_name = cart_item.product.title
          product_list.product_price = cart_item.product.promotional
          product_list.quantity = cart_item.quantity
          product_list.save
        end
        current_cart.clean!
        #OrderMailer.notify_order_placed(@order).deliver!
        redirect_to order_path(@order.token)
      else
        render 'carts/checkout'
      end
    else
      num = params[:num].to_i
      @product = Product.find(params[:product])
      @order.total = num * @product.promotional
      if @order.save
          product_list = ProductList.new
          product_list.order = @order
          product_list.product_id = @product.id
          product_list.product_name = @product.title
          product_list.product_price = @product.promotional
          product_list.quantity = num
          product_list.save
        #OrderMailer.notify_order_placed(@order).deliver!
        redirect_to order_path(@order.token)
      else
        render 'carts/checkout'
      end
    end

  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("alipay")
    @order.make_payment!

    redirect_to order_path(@order.token), notice: "使用支付宝成功完成付款"
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("wechat")
    @order.make_payment!

    redirect_to order_path(@order.token), notice: "使用微信成功完成付款"
  end

  def apply_to_cancel
    @order = Order.find(params[:id])
    #OrderMailer.apply_cancel(@order).deliver!
    flash[:notice] = "已提交申请"
    redirect_to :back
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
