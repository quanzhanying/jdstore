class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]


  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total =current_cart.total_price

    # flash[:notice]=current_cart.total_price
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
      # flash[:alert]="dsfdsf"z..........................
      render 'carts/checkout'
      # action或者thml
  end
end

    def show
      @order = Order.find_by_token(params[:id])
      @product_lists = @order.product_lists
    end

    def pay_with_alipay
      #@order = current_cart.order(params[:id])
        @order = Order.find(params[:id])

    if  @order.is_paid
        flash[:alert] = '您已支付过了'
        render :pay
        # redirect_to :back

        #不能用render
    else
        @order.is_paid = true
        @order.payment_method = params[:payment_method]
#这一步确定了是否支付的逻辑
    if @order.save
          # notice: "您已经支付过了"
          flash[:notice] = '支付成功'
          redirect_to order_path(@order.token)
    else
          flash[:alert] = '支付失败'
          redirect_to :back
    end
  end
end


    def pay_with_wechat
      # @order = current_cart.order(params[:id])
       @order = Order.find(params[:id])

      if @order.is_paid
        # == false不需要这句
        flash[:alert] = "您已支付过了"
        # :payment_method(params[:id])
        render :pay

      else
        @order.is_paid = true
        @order.payment_method = params[:payment_method]

     if order.save
        flash[:notice] = '支付成功'
        redirect_to order_path(@order.token)
      else
        flash[:alert] = "支付失败"
        redirect_to :back
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end


end
