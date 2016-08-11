class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:create]

  def index
    # @user = current_user
    @orders = Order.where(user_id: current_user)

  end

  def new
      @order = Order.new
  end



  def create
      @order = Order.new(order_params)
      @order.user = current_user
      @order.total = current_cart.total_price

      if @order.save
        current_cart.cart_items.each do |cart_item|
          product_list = ProductList.new
          product_list.order = @order
          product_list.product_name=cart_item.product.title
          product_list.product_price=cart_item.product.price
          product_list.quantity=cart_item.quantity
          product_list.save
        end

        redirect_to order_path(@order.token)

      else
        render :new
      end
    end

    def show
        @order = Order.find_by_token(params[:id])
        @product_lists = @order.product_lists
    end

    def destroy
      @order = Order.find(params[:id])
      @order.destroy
      redirect_to :back
    end


    def is_paid
       @order = Order.find(params[:id])
       if !@order.is_paid
         @order.is_paid!
         @order.payment_method = params[:payment_method]
         @order.save
         notify_order_email
         @order.make_payment!
       else
         flash[:alert]= "You have paid already! Thanks!"
       end
       redirect_to  orders_path
    end



    def change_state
      @order = Order.find(params[:id])
      @order.change_state!(@order)
      redirect_to :back
    end

    def return_good
      @order = Order.find(params[:id])
      @order.aasm_state = params[:aasm_state]
      @order.save
      flash[:notice] = "申请退货中..."
      redirect_to :back
      OrderMailer.notify_order_cancelled(@order).deliver!
    end

    private
    def order_params
      params.require(:order).permit(:billing_name,:billing_address,:shipping_name,:shipping_address)
    end

    def notify_order_email
      OrderMailer.notify_order_placed(@order).deliver!
    end


end
