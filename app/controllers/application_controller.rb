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

  private 
def find_cart
	cart = Cart.find_by(id: session[:cart_id])
	if cart.blank?
		cart = Cart.create
	end
	session[:cart_id] = cart.id
	return cart
end

def show_product_image(product)
    link_to product_path(product) do
    if product.image.present?
      image_tag(product.image.thumb.url, class: "thumbnail")
    else
      image_tag("http://placehold.it/200x200&text=No Pic", class: "thumbnail")
    end
  end
end

end
