class ProductsController < ApplicationController
  def index
    @products = Product.recent.where(:is_hidden => false).paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @product = Product.find(params[:id])
    if @product.is_hidden
      flash[:warning] = "This Product already archived"
      redirect_to root_path
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    flash[:notice] = "测试加入购物车"
    redirect_to :back
  end
end
