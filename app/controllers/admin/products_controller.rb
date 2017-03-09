class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  def index
    @products=Product.all
  end
def new
  @product=Product.new
end
  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "新增货物成功！"
      redirect_to admin_products_path
    else
      render :new
    end
  end

def show
  @product=Product.find(params[:id])
end

def edit
  @product=Product.find(params[:id])
end

 def update
   @product = Product.find(params[:id])

   if @product.update(product_params)
     redirect_to admin_products_path
   else
     render :edit
   end
 end

  def require_is_admin
    if !current_user.admin?
      flash[:alert]= "you're not admin!"
      redirect_to root_path
    end
  end
private
def product_params
  params.require(:product).permit(:title, :description, :price, :quantity, :image)

end
end
