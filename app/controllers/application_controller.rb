class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout "black"

  def require_is_admin
    @user=current_user
    if @user.is_admin == false
      flash[:alert]="You are not admin!"
      redirect_to root_path
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def find_cart
    cart=Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart=Cart.create
    end
    session[:cart_id]=cart.id
    return cart

  end


end
