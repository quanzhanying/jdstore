class Admin::OrdersController < AdminController

  before_action :find_order, only: [:show, :ship, :shipped, :cancel, :return]

  def index
    @orders = Order.all.order("id DESC")
  end

  def show
    @product_lists = @order.product_lists
    @template_lists = @order.template_lists
  end

  def ship
    @order.ship!
    OrderMailer.notify(@order).deliver!
    redirect_to :back
  end

  def shipped
    @order.deliver!
    redirect_to :back
  end

  def cancel
    @order.cancel_order!
    OrderMailer.notify(@order).deliver!
    redirect_to :back
  end

  def return
    @order.return_good!
    redirect_to :back
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

end
