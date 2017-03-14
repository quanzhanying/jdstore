class Admin::ProductsController < ApplicationController

layout "admin"
before_action :authenticate_user!
before_action :admin_required

def move_up
  @product=Product.find(params[:id])
  @product.move_higher
  redirect_to :back
end

def move_down
  @product=Product.find(params[:id])
  @product.move_lower
  redirect_to :back
end

  def index
    @products=Product.all.order('position ASC')
  end

  def new
    @product =Product.new

  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to admin_products_path
    else
      render :new
    end
  end


  def edit
    @product=Product.find(params[:id])
  end

  def update
    @product=Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product=Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
    flash[:alert]="Product deleted"
  end

    private
    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :image,:place,:kind,:owner,:position)
    end
end
