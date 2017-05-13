class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end


  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
      flash[:notice] = "创建商品成功"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])

  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
      flash[:notice] = "更新商品信息成功"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to admin_products_path, alert:'已删除商品'
  end

  private

  def product_params
    params.require(:product).permit(:description,:title,:quantity,:price)
  end

end
