class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.published.recent
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @cart_item = CartItem.find_by(params[:id])
    if existing_item && current_cart.id == existing_item.cart_id && existing_item.price == Product.find(cart_item_params[:product_id]).price
  			existing_item.quantity += cart_item_params[:quantity].to_i
  			existing_item.save
  		else #否则新建购物条目
  			@cart_item = CartItem.new(cart_item_params)
  			@cart_item.cart_id = current_cart.id

  		# 以后可以将这里封装到model中去
  			@cart_item.price = Product.find(cart_item_params[:product_id]).price
  			@cart_item.save
  end
    redirect_to :back
  end


end
