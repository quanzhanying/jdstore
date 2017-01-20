class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @products = Product.all.order("updated_at DESC")
  end

  def new
    @product = Product.new
  end

 def create
   @product = Product.new(product_params)
   if @product.save
     redirect_to admin_products_path, notice: "成功添加商品！"
   else
     render :new
   end
 end

 def edit
   @product = Product.find(params[:id])
 end

 def update
   @product = Product.find(params[:id])
   if params[:product][:image] && @product.image
      old_image = Product.find(params[:id]).image
  end
  if @product.update(product_params)
      old_image.remove! if old_image
     redirect_to admin_products_path, notice: "修改成功！"
  else
     render :edit
  end
 end

 def destroy
   @product = Product.find(params[:id])
   @product.delete
   redirect_to admin_products_path, alert: "已删除商品！"
 end

 def show
   @product = Product.find(params[:id])
 end


 private

 def product_params
   params.require(:product).permit(:title, :description, :price, :stock, :is_hidden, :image)
 end
 def check_admin
   if !current_user.is_admin
     redirect_to root_path, alert: "当前账号"+current_user.email+"不是admin！"
   end
 end

end
