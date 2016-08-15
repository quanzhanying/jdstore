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
    #binding.pry
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

  def pay_with_alipay
    @order = Order.find(params[:id])
    if @order.is_paid
      flash[:warning] = "Already Paid"
      redirect_to :back
    else
      @order.is_paid = true
      if @order.save
        flash[:notice] = "Paid Success"
      else
        flash[:alert] = "Paid Failed"
        redirect_to :back
      end
    end
    @order.make_payment!
  end

    def pay_with_wechat
      @order = Order.find(params[:id])
      if @order.is_paid
        flash[:warning] = "Already Paid"
        redirect_to :back
      else
        @order.is_paid = true
          if @order.save
            flash[:notice] = "Paid Success"
          else
            flash[:alert] = "Paid Failed"
            redirect_to :back
          end
        end
      end

      # def cancel
      #   @order = current_user.orders.find(params[:id])
      #   @order.cancel!
      #   flash[:notice] = "You already cancel the order"
      #   redirect_to :back
      # end


      def cancel
        @order = Order.find(params[:id])
        OrderMailer.notify_cancel_order(@order).deliver!
        flash[:notice] = "Applied"
        redirect_to :back
      end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
