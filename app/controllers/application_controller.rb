class ApplicationController < ActionController::Base
  after_action :store_location
  protect_from_forgery with: :exception
  helper_method :current_cart

  def require_admin
    if !current_user.admin?
      redirect_to "/", alert: "permission denied."
    end
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      puts
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
     session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
  end

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

    cart
  end

end
