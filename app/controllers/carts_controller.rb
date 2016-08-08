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
    product = cart_item.product.quantity
    current_count = cart_item.quantity
    puts "#{product}sfsdfsdfsd#{current_count}"
    if product.blank? && current_count.blank? && current_count > 0 && current_count < product
      if cart_item.update(cart_item_params)
        redirect_back(fallback_location: root_path)
      else
        flash[:alert] = "Faild changed... item's quantity must less than product's quantity"
        # @cart_items = current_cart.cart_items
        # @cart = Cart.new
        # render "index"
        # redirect_back(fallback_location: root_path)
        render "index"
      end
    else
      # @cart_items = current_cart.cart_items
      # @cart = Cart.new
      flash[:alert] = "Faild changed...item's quantity must less than product's quantity and must be number."
      render "index"
      # redirect_back(fallback_location: root_path)
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end
