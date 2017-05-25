class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin."
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
    
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product)
      #flash[:notice] = "你已成功将#{@product.title} 加入购物车"
    else
      #flash[:warning] = "你的购物车内已有此物品"
      ci = current_cart.cart_items.find_by(product_id: @product)
      ci.quantity += 1
      ci.save
    end
    #redirect_to :back
  end


  def favorite
    @product = Product.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorite_products << @product
      redirect_to :back

    elsif type == "unfavorite"
      current_user.favorite_products.delete(@product)
      redirect_to :back

    else
      redirect_to :back
    end
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end
end
