class Admin::CategoryController < ApplicationController
   layout "admin"
   before_action :authenticate_user!
   before_action :admin_required

   def index
      @category = Category.all
   end

   def new
      @category = Category.new
   end

   def edit
      @category = Category.find(params[:id])
   end

   def update
      @category = Category.find(params[:id])

      if @category.update(category_params)
         redirect_to admin_category_path
      else
         render :edit
      end
   end


   def create
      @category = Category.new(category_params)
      if @product.save
         redirect_to admin_category_path
      else
         render :new
      end
   end

   def destroy
     @category = Category.find(params[:id])
     @category.destroy
     redirect_to admin_category_path
   end


   private

   def category_params
      params.require(:category).permit(:title, :description, :quantity, :price, :image, :category_id, :category_name)
   end
end
