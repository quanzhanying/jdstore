class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  # def new
  #   @product = Product.new
  # end
  #
  # def create
  #   @product = Product.new(product_params)
  #   if @product.save
  #     redirect_to products_path
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @product = Product.find(params[:id])
  # end
  #
  # def update
  #   @product = Product.find(params[:id])
  #   if @product.update(product_params)
  #     redirect_to products_path, notice: '商品信息更新成功！'
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @product = Product.find(params[:id])
  #   @product.destroy
  #   redirect_to products_path, alert: '商品已移除'
  # end
  #
  # private
  #
  # def product_params
  #   params.require(:product).permit(:title, :description, :price, :stock)
  # end
end
