class ProductsController < ApplicationController
  def index
    @products = Product.where(is_hidden: false)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    # if current_cart.add_product_to_cart(@product)
    #   flash[:alert] = "fails"
    # else
    #   flash[:notice] = "successfully"
    # end
    #
    # redirect_to :back

    if @product.storage > 0
      if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "Add #{@product.title} to cart!"
      else
        flash[:alert] = "#{@product.title} has existed in cart!"
      end
    else
      flash[:alert] = "#{@product.title} has no storage!"
    end

    redirect_to :back
    # if $add_cart_msg == "Add this successfully!"
    #
    #     # if !current_cart.cart_items.include?(@product)
    #     #   flash[:alert]= "Don't add one item twice"
    #     # else
    #     # end
    #
    #     if $check_exist_msg == "This item has existed in your cart!"
    #       redirect_to :back, alert: $check_exist_msg
    #     else
    #       redirect_to :back, notice: $add_cart_msg # 因为报错告诉我找不到局部变量，所以我被逼无奈设定了一个全局变量
    #     end
    # else
    #   redirect_to :back, alert: $add_cart_msg
    # end


  end

  # def no_storage_alert
  #   # redirect_to :back, alert: "No storage!"
  # end
end
