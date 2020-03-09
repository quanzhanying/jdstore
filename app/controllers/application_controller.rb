class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :fetch_home_data #這樣寫會增加數據查詢量，後續更新

  def fetch_home_data
    @categories = Category.grouped_data
  end

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin."
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
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
