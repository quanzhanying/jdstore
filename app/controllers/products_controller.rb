class ProductsController < ApplicationController

  def index
    @products=Product.where(:is_hidden=>false)
  end

  def new
    @product=Product.new
  end

  def show
    @product=Product.find(params[:id])
    if @product.is_hidden
      flash[:waring]="此商品已下架！"
      redirect_to root_path
    end
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
    else
      render :edit
    end

  end

  def destroy
    @product =Product.find(params[:id])

    @product.destroy
    redirect_to products_path ,alert:'Product deleted'
  end

  def add_to_cart
      @product=Product.find(params[:id])

      current_cart.add_product_to_cart(@product)

      redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:title,:description,:quantity,:price,:is_hidden)
  end
end
