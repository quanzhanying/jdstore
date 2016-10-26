class ProductsController < ApplicationController

  def index
    @products=Product.all
  end

  def new
    @product=Product.new
  end

  def show
    @product=Product.find(params[:id])
  end

  def edit
    @product=Product.find(params[:id])
  end

  def create
    @product=Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path,notice:'Update Success'
    end
      render :edit
    else

    end
  end
  def destroy
    @product =Product.find(parmas[:id])

    @product.destroy
    redirect_to products_path ,alert:'Product deleted'

  private

  def product_params
    params.require(:product).permit(:title,:description,:quantity,:price)
  end
end
