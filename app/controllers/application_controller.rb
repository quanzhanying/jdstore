class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def find_cart
    # 进场先找是否已经有了购物车
    @cart = Cart.find_by(id:session[:cart_id])
    # 如果没有则新建一个
    if @cart.blank?
      @cart = Cart.create
    end
    # 获取sessionid
    session[:cart_id] = @cart.id
    return @cart
  end

end
