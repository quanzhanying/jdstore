class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"
  def index
    @orders = Order.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

  end

  def show
    @order = Order.find_by_token(params[:id])
    @product = product_list.product
    OrderMailer.notify_order_placed(@order).deliver!
  end

  def cancell_order
    @order = Order.find(params[:id])
    @order.cancell_order!
    @order.save
    redirect_to :back
    OrderMailer.notify_order_cancelled(@order).deliver!
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    @order.save
    redirect_to :back
  end

  def deliver
    @order = Order.find(params[:id])
    @order.deliver!
    @order.save
    redirect_to :back
    OrderMailer.notify_shipped(@order).deliver!
  end

    def return_good
      @order = Order.find(params[:id])
      @order.return_good!
      @order.save
      redirect_to :back
      OrderMailer.notify_return_good(@order).deliver!
  end






  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :is_paid, :payment_method,:is_cancell,:is_ship)
  end

end
