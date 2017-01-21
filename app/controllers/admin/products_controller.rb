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
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @job = Product.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_procducts_path
    else
      render :edit
    end
  end
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def destroy
    @product =Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end
  private
   def product_params
     params.require(:product).permit(:title, :description, :quantity, :price)
   end

end
