class ProductsController < ApplicationController
  def index
    @products = Product.where(is_hidden: false)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    if $add_cart_msg == "Add this successfully!"
      redirect_to :back, notice: $add_cart_msg # 因为报错告诉我找不到局部变量，所以我被逼无奈设定了一个全局变量
    else
      redirect_to :back, alert: $add_cart_msg
    end
  end

  def no_storage_alert
    # redirect_to :back, alert: "No storage!"
  end
end
