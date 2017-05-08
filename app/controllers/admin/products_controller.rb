class Admin::ProductsController < ApplicationController
 before_action :authenticate_user!
 before_action :admin_require

 def index
   @products = Product.all
 end

 def new
   @product = Product.new
 end

 def create
   @product = Product.new(product_params)
   if @product.save
     flash[:notice] = "create product success!"
     redirect_to admin_products_path
   else
     flash[:error] = "failed to create product!";
     render :new;
   end
 end

 def update
   @product = Product.find(params[:id])
   if @product.update(product_params)
     flash[:notice] = "update product success!"
     redirect_to admin_product_path(@product)
   else
     flash[:error] = "failed to update product!"
     render :new;
   end
 end

 def edit
   @product = Product.find(params[:id])
 end

 def show
   @product = Product.find(params[:id])
 end

 def destroy
   @product = Product.find(params[:id])
   if @product.delete
     flash[:notice] = "delete product success!"
     redirect_to admin_products_path
   else
     flash[:error] = "failed to delete product!"
   end
 end

 private

 def product_params
   params.require(:product).permit(:title, :description, :price, :quantity, :image)
 end


 def admin_require
     if !current_user.is_admin?
       redirect_to "/"
     end
  end
end
