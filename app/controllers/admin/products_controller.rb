class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"
  def index
   @products = Product.all
 end

 def new
   @product = Product.new
 end

 def create
   @product = Product.new(product_params)
   if @product.save
     redirect_to admin_products_path, notice: "添加成功！"
   else
     render :new
   end
 end

def edit
  @product = Product.find(params[:id])
end

def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
    redirect_to admin_products_path, notice: "修改成功！"
  else
    render :edit
  end
end

private

def product_params
  params.require(:product).permit(:title, :description, :quantity, :price, :image)
end

def admin_required
  if !current_user.admin?
    redirect_to root_path, alert: "您没有管理员权限！"
  end
end



end
