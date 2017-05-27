class Admin::CategoryGroupsController < ApplicationController
  # 使用者必須登入
   before_action :authenticate_user!
   # 使用者必須是 admin 身份
   before_action :admin_required
   # 後台頁面排版
   layout "admin"

   def show
     @category_group = CategoryGroup.find(params[:id])
   end

   def new
     @category_group = CategoryGroup.new
   end

   def create
     @category_group = CategoryGroup.new(category_group_params)

     if @category_group.save
       redirect_to admin_categories_path
     else
       render :new
     end
   end

   def edit
     @category_group = CategoryGroup.find(params[:id])
   end

   def update
     @category_group = CategoryGroup.find(params[:id])

     if @category_group.update(category_group_params)
       redirect_to admin_categories_path
     else
       render :edit
     end
   end



   private

   def category_group_params
     params.require(:category_group).permit(:name )
   end

 end
