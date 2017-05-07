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
end
