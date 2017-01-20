class Admin::ProductsController < ApplicationController
  # before action :authenticate_user!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to  admin_products_path
    else
      render :new
    end
end

   def edit
     @product = Product.find(params[:id])
   end

   def update
     @product = Product.find(pramas[:id])
     if @product.update(product_params)
       flash
       redirect_to admin_products_path
     else
       render :edit
     end
   end

private
   def product_params
  params.require(product).permit(:title,:description,:quantity,:price)
end

end
