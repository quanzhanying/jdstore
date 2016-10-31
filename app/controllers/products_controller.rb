class ProductsController < ApplicationController
  before_action :authenticate_user!
  #before_action :admin_require

  def index
    @products = Product.published.recent
  end

  def show
    @product = Product.find(params[:id])
  end

  # def new
  #   @product =Product.new
  # end
  def admin_require
    if !current_user.admin?
      redirect_to root_path
    end
  end
end
