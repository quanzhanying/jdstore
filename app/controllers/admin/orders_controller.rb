class Admin::OrdersController < ApplicationController
  before_action:authenticate_user!
    before_action:admin_required
    layout "admin"
    def index
      @orders = Order.all
    end

    def show

      @order = Order.find_by_token(params[:id])
    end

end
