class OrdersController < ApplicationController

  before_action :authenticate_user!
 
  def index
  	@orders = Order.where(user_id: current_user.id).all
    
  end

  def new
  	@order = Order.new
    @delivery_addresses = current_user.delivery_addresses
    # 已经属于某order的items不是这次新加入购物车的items，应当筛出去
    @cart_items = current_user.cart.cart_items.where(order_id: nil)
  end

  def create

    if params[:delivery_address].nil?
      redirect_to new_order_path, notice: "请选择您的收货地址"
    elsif params[:cart_items].nil?
      redirect_to new_order_path, notice: "购物车为空"
    else
      @order = Order.new
      @order.delivery_address_id = params[:delivery_address].to_i
      cart_item_ids = params[:cart_items].split(" ").map { |s| s.to_i }


      # cart_item条目填入order的信息，说明这个条目已属于某特定的order
      cart_item_ids.each do |item_id|
        item = CartItem.find(item_id)
        # item.order_id = @order.id
        item.order = @order
        item.save

        product = Product.find(item.product_id)
        product.quantity = (product.quantity - item.quantity)
        product.save

      end

      @order.user = current_user
      @order.status = "ORDERED"
      @order.save

      redirect_to root_path

    end   

  end

  def update
    @order = Order.find(params[:id])
    if @order.user_id == current_user.id
      if @order.status == "ORDERED"
        @order.status = "PAID"
      elsif @order.status == "DELIVERING"
        @order.status = "DELIVERED"
      else
        redirect_to orders_path, notice: "Order Update Failed"
      end
      @order.save
      redirect_to orders_path, notice: "完成支付"
    else
      redirect_to orders_path, notice: "Order Update Failed"
    end
  end


  def show

  end

  private 



end
