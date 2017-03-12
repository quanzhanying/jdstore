class Account::ProductsController < ApplicationController
   layout "admin"
   before_action :authenticate_user!

   def index
     @products = current_user.products
   end

   # 查看 R
   def show
       @product = Product.find(params[:id])
   end
end
