class CartsController < ApplicationController

  def delete_products
    current_cart.cart_items.delete_all
    redirect_to carts_path
  end
end
