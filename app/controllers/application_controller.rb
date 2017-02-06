class ApplicationController < ActionController::Base
    def admin_required
        redirect_to '/' unless current_user.is_admin?
    end

    helper_method :current_cart

    def current_cart
        @current_cart ||= find_cart
    end

    private

    def find_cart
        cart = Cart.find_by(id: session[:cart_id])
        cart = Cart.create if cart.blank?

        session[:cart_id] = cart.id
        cart
    end
end
