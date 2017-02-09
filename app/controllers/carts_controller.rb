class CartsController < ApplicationController
  def index

  end

  def checkout
    @order = Order.new 
  end
end
