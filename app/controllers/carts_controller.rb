class CartsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @cart_items = current_cart.cart_items
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

  def edit_cart_item_count
    cart_item = CartItem.find_by_id(params[:id])
    result = cart_item.edit_cart_item_count!(params[:cart_item][:quantity])
    if result
      flash[:notice] = "Edit count Successfully."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Faild changed... item's quantity must less than product's quantity"
      render "index"
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end
