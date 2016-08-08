class CartsController < ApplicationController

  def index
    @cart_items = current_cart.cart_items
    @cart = Cart.new
  end

  def del_cart_items
    ids = params[:itemids]
    if current_cart.del_cart_items(ids)
      flash[:notice] = "Successfully deleted..."
    else
      flash[:alert] = "Faild deleted..."
    end
    redirect_back(fallback_location: root_path)
  end

  def up_cart_item_count
    @cart_item = CartItem.find(params[:id])
    if @cart_item.up_count!
      flash[:notice] = "Successfully up..."
    else
      flash[:notice] = "Faild up..."
    end
    redirect_back(fallback_location: root_path)
  end

  def down_cart_item_count
    @cart_item = CartItem.find(params[:id])
    if @cart_item.down_count!
      flash[:notice] = "Successfully down..."
    else
      flash[:notice] = "Faild down..."
    end
    redirect_back(fallback_location: root_path)
  end

  def check_out
    @order = Order.new
    @cart_items = current_cart.cart_items
  end
end
