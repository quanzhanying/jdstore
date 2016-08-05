class CartsController < ApplicationController
  def checkout
    @order = Order.new
  end
end
