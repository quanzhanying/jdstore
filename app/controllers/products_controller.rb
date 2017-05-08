class ProductsController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end
  def index
    @products = Product.all
  end
  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_to :back
    flash[:notice] = "成功加入购物车"
  end
  helper_method :current_cart
  def current_cart
    @current_cart ||= find_cart
  end

end
private
def product_params
  params.require(:product).permit(:title, :description, :quantity, :price, :image)
end
def find_cart
  cart = Cart.find_by(id: session[:cart_id])
  if cart.blank?
    cart = Cart.create
  end
  session[:cart_id] = cart.id
  return cart
end
