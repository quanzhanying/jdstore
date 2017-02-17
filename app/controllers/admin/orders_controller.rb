class Admin::OrdersController < ApplicationController
before_action :authenticate_user!
  before_action :admin_required

  layout 'admin'

  def index
    @orders =Order.order("id DESC")
  end

  def show
    @order=Order.find(params[:id])
    @product_lists =@order.product_lists
  end





  private

    def order_params
      params.require(:product).permit(:title, :description, :quantity, :price, :image)
    end
end
