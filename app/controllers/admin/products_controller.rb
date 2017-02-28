class Admin::ProductsController < ApplicationController
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




  def require_is_admin
    if !current_user.admin?
      flash[:alert]= "you're not admin!"
      redirect_to root_path
    end
  end
private
def product_params
  params.require(:product).permit(:title, :description, :price, :quantity)

end
end
