class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: '商品新增成功'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)

    if @product.save
      redirect_to admin_products_path, notice: '商品修改成功'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
      redirect_to admin_products_path, notice: '商品删除成功'
  end

private

  def product_params
    params.require(:product).permit(:title,:description,:price,:quantity)
  end

end
