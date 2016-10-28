class ProductsController < ApplicationController
 before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

 def index
   @products = Product.where(:is_hidden => false).order("created_at DESC")
 end

 def show
   @product = Product.find(params[:id])

   if @product.is_hidden
     flash[:warning] = "This Job already archieved"
     redirect_to
   end
 end


end
