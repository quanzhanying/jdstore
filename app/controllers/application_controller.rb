class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart #可以试验一下拆开 ||=
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])

    if cart.blank?
      cart = Cart.create
    end

    session[:cart_id] = cart.id

    return cart #这是什么鬼？怎么这么简洁。明白了cart就是return cart，def的最后一句是返回值
  end
end
