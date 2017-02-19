class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save
      current_cart.cart_items.each do |cart_item|
        if !cart_item.product.is_hidden
        product_list = ProductList.new
        product_list.order = @order
        product_list.produt_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.style = cart_item.product.style
        product_list.save
        end
      end

      chef = Chef.find(current_cart.chef_id)
      @chef_shadow = ChefShadow.new
      @chef_shadow.order = @order
      @chef_shadow.name = chef.name
      @chef_shadow.chef_level_id = chef.chef_level_id
      @chef_shadow.style = chef.style
      @chef_shadow.phone = chef.phone
      @chef_shadow.save

      current_cart.chef_id = nil
      current_cart.save
      current_cart.clean!

      OrderMailer.notify_order_placed(@order, @chef_shadow).deliver!

      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
    @chef_shadow = ChefShadow.find_by(order_id: @order.id)
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

    redirect_to order_path(@order.token), notice: "使用微信支付功完成付款"
  end

  def apply_to_cancel
    @order = Order.find(params[:id])
    @chef = ChefShadow.find_by(order_id: @order.id)
    OrderMailer.apply_cancel(@order, @chef).deliver!
    flash[:notice] = "已提交撤销申请"
    redirect_to :back
  end

  def apply_to_return
    @order = Order.find(params[:id])
    @chef = ChefShadow.find_by(order_id: @order.id)
    OrderMailer.apply_return(@order, @chef).deliver!
    flash[:notice] = "已提交退货申请"
    redirect_to :back
  end

  private
  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
