class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :get_order, only: [:pay, :confirm, :cancel, :return_good, :pay_by_wechat, :pay_by_alipay]

  def index
  	@orders = Order.where(user_id: current_user.id).all.order("created_at DESC")
    
  end

  def new
  	@order = Order.new
    @delivery_addresses = current_user.delivery_addresses
    # 已经属于某order的items不是这次新加入购物车的items，应当筛出去
    @cart_items = current_cart.cart_items.where(order_id: nil)
  end

  def create

    if params[:delivery_address].nil?
      redirect_to new_order_path, notice: "请选择您的收货地址"
    elsif params[:cart_items].nil?
      redirect_to new_order_path, notice: "购物车为空"
    else
      @order = Order.new
      @order.is_paid = false
      @order.delivery_address_id = params[:delivery_address].to_i
      cart_item_ids = params[:cart_items].split(" ").map { |s| s.to_i }


      # cart_item条目填入order的信息，说明这个条目已属于某特定的order
      cart_item_ids.each do |item_id|
        item = CartItem.find(item_id)

        item.order = @order
        product = Product.find(item.product_id)

        existing_product = ProductList.find_by_product_id(item.product_id)

        if existing_product.nil?
          product_list = ProductList.new
        else
          product_list = existing_product
        end

        product_list.quantity = item.quantity
        product_list.price = product.price
        product_list.product_id = product.id
        product_list.order = @order
        product_list.save

        product.quantity = (product.quantity - item.quantity)

        item.destroy
        product.save

      end

      @order.user = current_user
      @order.save

      ## Add Mailer
      OrderMailer.order_email(current_user, @order).deliver


      redirect_to order_path(@order.token)

    end   

  end

  def show
    @order = Order.find_by_token(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    if @order.user_id == current_user.id
      if @order.order_placed?
        @order.make_payment!
      elsif @order.shipping?
        @order.deliver!
      else
        redirect_to orders_path, notice: "Order Update Failed"
      end
      @order.save
      redirect_to orders_path, notice: "完成支付"
    else
      redirect_to orders_path, notice: "Not current user's order"
    end
  end

  def cancel
    @order.cancell_order!
    @order.cart_items.each do |item|
      if item.product
        item.product.quantity += item.quantity
        item.product.save
      end
    end
    redirect_to orders_path, notice: "成功取消订单"
  end

  def pay
    @order.make_payment!
    redirect_to orders_path, notice: "完成支付"
  end

  def pay_by_wechat
    @order.is_paid = true
    @order.paid_by = "wechat"
    @order.save
    @order.make_payment!
    redirect_to orders_path, notice: "完成微信支付"    
  end

  def pay_by_alipay
    @order.is_paid = true    
    @order.paid_by = "alipay"
    @order.save
    @order.make_payment!
    redirect_to orders_path, notice: "完成支付宝支付"    
  end

  def confirm
    @order.deliver!
    redirect_to orders_path, notice: "确认收货"
  end

  def return_good
    @order.return_good!
    @order.product_lists.each do |list|
      product = Product.find_by(id: list.product_id)
      if product
        product.quantity += list.quantity
        product.save
      end
    redirect_to orders_path, notice: "退货成功"
    end
  end

  private 

  def get_order
    @order = Order.find(params[:id])
  end



end
