class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to root_path, notice: "Success"
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path, notice: "Update success"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, alert: "Product Deleted"
  end

  # def join
  #   @product = Product.find(params[:id])
  #
  #   if
  #     current_user.join!(@product)
  #     flash[:notice] = "加入收藏成功!"
  #   else
  #     flash[:warning] = "你已经收藏成功了！"
  #   end
  #
  #   redirect_to product_path(@product)
  # end
  #
  # def quit
  #   @product =Product.find(params[:id])
  #   if
  #     current_user.quit!(@product)
  #     flash[:alert] = "你已经取消收藏！"
  #   else
  #     flash[:warning] = "你没有收藏！"
  #   end
  #
  #   redirect_to product_path(@product)
  # end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end

end
