class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
      if !current_user.admin?
        flash[:alert] = 'You are not admin!'
        redirect_to root_path
      end
  end

  helper_method :current_cart
#  current_cart其实原本是一个 controller 内的 method，我们为了要在 view 里面要可以存取它。
#  所以，我们得在 applications_controller.rb 宣告他是 helper_method，才能直接存取。
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
