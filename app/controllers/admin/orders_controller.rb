class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order("id DESC")
  end

  def show
     @order = Order.find(params[:id])
     @product_lists = @order.product_lists
  end

  def ship
      @order = Order.find(params[:id])
      @order.ship!
      OrderMailer.notify_ship(@order).deliver!
      redirect_to :back
    end

    def shipped
      @order = Order.find(params[:id])
      @order.deliver!
      redirect_to :back
    end

    def cancel
      @order = Order.find(params[:id])
      @order.cancell_order!
      OrderMailer.notify_cancel(@order).deliver!
      redirect_to :back
    end

    def return
      @order = Order.find(params[:id])
      @order.return_good!
      redirect_to :back
    end

    def notify_ship(order)
        @order        = order
        @user         = order.user
        @product_lists = @order.product_lists

        mail(to: @user.email, subject: "[JDStore] 您的订单 #{order.token}已发货")
      end

      def notify_cancel(order)
        @order        = order
        @user         = order.user
        @product_lists = @order.product_lists

        mail(to: @user.email, subject: "[JDStore] 您的订单 #{order.token}已取消")
      end

end
