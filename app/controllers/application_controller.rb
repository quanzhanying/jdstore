class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart     # a ||= b ,意思是如果给a是nil的话，啊会被赋予b值 ，这里如果@current_cart当前没有购物车，就按照find_cart方法新建一个购物车
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])    #如果已有一台车，那已登记的session车，就是当前购物车
    if cart.blank?                                #如果你没有车
      cart = Cart.create                          #就建立一台新车
    end
    session[:cart_id] = cart.id                   #新取的车的cart_id，登记保存进session
    return cart
  end

end
