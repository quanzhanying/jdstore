class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_superadmin
  before_action :find_order, only: [:ship, :deliver, :return_good, :cancell_order]
  after_action :redirect_to_admin_orders_and_flashes, only: [:ship, :deliver, :return_good, :cancell_order]

  def index
    @orders = Order.all
  end

  # def make_transitions
  #   @order = Order.find(params[:id])
  #   # if @order.update(order_params)
  #   #   redirect_to :back
  #   # else
  #   #   flash[:alert] = "jj"
  #   #   redirect_to :back
  #   # end
  #
  #   # @order.aasm.current_event = params[:aasm_state]
  #   if params[:aasm_state] == :ship
  #     @order.ship!
  #   elsif @order.aasm.current_event == :deliver
  #     @order.deliver!
  #   else
  #     flash[:alert] = "No Matches"
  #   end
  #   redirect_to :back
  # end

  def ship
    @order.ship!
    redirect_to :back
  end

  def deliver
    @order.deliver!
    redirect_to :back
  end

  def return_good
    @order.return_good!
    redirect_to :back
  end

  def cancell_order
    @order.cancell_order!
    redirect_to :back
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def redirect_to_admin_orders_and_flashes
    flash[:notice] = "Order No.#{@order.id} status has changed to #{@order.aasm_state}"
    # redirect_to :back
  end

  # def order_params
  #   params.require(:order).permit(:aasm_state)
  # end
end
