class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total =current_cart.total_price

    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
      end

      redirect_to order_path(@order.token) #怎么快速识别哪个path对应的路径?
    else
      render 'carts/checkout'
    end
  end

    def show
      @order = Order.find_by_token(params[:id])
      @product_lists = @order.product_lists
    end

    def pay_with_alipay
      @order = current_cart.order(params[:id])
      if  @order.is_paid?
        render :pay
      else

        # notice: "您已经支付过了"
        redirect_to order_path(@order)
        flash[:alert] = 'You are not admin'
      end
    end


    def pay_with_wechat
      @order = current_cart.order(params[:id])
      if @order.is_paid?
      render :pay
    else

      redirect_to order_path(@order)
      flash[:alert] = 'You are not admin'
      end
    end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end


end
