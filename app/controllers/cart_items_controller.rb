class CartItemsController < ApplicationController
  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.destroy

    flash[:alert] = "Cart_item Deleted"
    redirect_to carts_path
  end

  def add_one   #其实是edit功能
    @cart_item = current_cart.cart_items.find(params[:id])
    # sum = 1
    @cart_item.quantity = @cart_item.quantity + 1
    @cart_item.save
    # @cart_items.each do |ao|
    #   sum = ao.quantity + 1
    # end
    # sum
    redirect_to :back
  end

  def minus_one
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.quantity = @cart_item.quantity - 1
    @cart_item.save
    redirect_to :back
  end


end


# def add_product_to_cart(product)
#   ci = cart_items.build
#   ci.product = product
#   ci.quantity = 1
#   ci.save
# end
#
# def total_price
#   sum = 0
#   cart_items.each do |cart_item|
#     sum += cart_item.quantity * cart_item.product.price
#   end
#   sum
# end

# def new
#   @product = Product.new
# end
#
# def create
#   @product = Product.new(product_params)
#
#   if @product.save
#     redirect_to admin_products_path
#   else
#     render :new
#   end
# end
#
# def index
#   @products = Product.all
#
# end
#
# def edit
#   @product = Product.find(params[:id])
#
# end
#
# def update
#   @product = Product.find(params[:id])
#   if @product.update(product_params)
#     redirect_to admin_products_path
#   else
#     render :edit
#   end
# end
#
#
#
# private
#
# def product_params
#   params.require(:product).permit(:title, :description, :quantity, :price, :image)
# end
# end
