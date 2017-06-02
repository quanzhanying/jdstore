class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = case params[:state]
              when 'placed'
                current_user.orders.where(aasm_state: "order_placed").order('id DESC')
              when 'paid'
                current_user.orders.where(aasm_state: ["paid", "shipping"]).order('id DESC')
              when 'cancelled'
                current_user.orders.where(aasm_state: ["order_cancelled", "good_returned"]).order('id DESC')
              when 'finished'
                current_user.orders.where(aasm_state: "shipped").order('id DESC')
              else
                current_user.orders.order('id DESC')
              end
  end
end
