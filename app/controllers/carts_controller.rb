class CartsController < ApplicationController

  def index
    @cart_items = current_cart.cart_items
  end
  
  def del_all_cart_item
    if current_cart.del_all_product_from_cart
      flash[:notice] = "Successfully deleted..."
    else
      flash[:alert] = "Faild deleted..."
    end
    redirect_back(fallback_location: root_path)
  end

end
