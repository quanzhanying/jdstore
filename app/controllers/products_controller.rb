class ProductsController < ApplicationController

  before_action :authenticate_user! , only: [:order]
  # 管理员自动跳转
  # before_action :admin_redirect

  def index
    # if current_user and current_user.admin?
    #   redirect_to '/admin/products'
    # end
    @products = Product.all
  end



  # def create
  #   @product = Product.new(product_params)

  #   if @product.save
  #     redirect_to products_path, notice: "新建成功"
  #   else
  #     render :new
  #   end
  # end

  # def new
  #   @product = Product.new
  # end

  # def edit
  #   @product = Product.find(params[:id])
  # end

  def show
    @product = Product.find(params[:id])
  end

  # def update
  #   @product = Product.find(params[:id])

  #   if @product.update(product_params)
  #     redirect_to products_path,  notice: "更新成功"
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @product = Product.find(params[:id])

  #   @product.destroy
  #   redirect_to products_path

  # end

  # def order
    
  # end
  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_to :back
  end


  private

  # def product_params
  #   params.require(:product).permit(:title, :description, :quantity, :price)
  # end

  def admin_redirect
    if current_user and current_user.admin?
      redirect_to admin_products_path
    end
  end


end
