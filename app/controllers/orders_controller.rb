class OrdersController < ApplicationController
 
  def index
  	@orders = Order.all
  end

  def new
  	@order = Order.new
  	@user = current_user
  end

  def create
  end


  def show
  end


end
