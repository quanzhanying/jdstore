class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"

  def index
    @products = Product.where.not(:id => 1) #1 is a dummy product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "Product Created."
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
      redirect_to admin_products_path, notice: "Product Updated."
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    cart_items = CartItem.where(product_id: params[:id])
    cart_items.update_all(product_id: 9)

    redirect_to admin_products_path, alert: "Product deleted."
  end

  def publish
    @product = Product.find(params[:id])
    @product.publish!
    redirect_to :back
  end

  def hidden
    @product = Product.find(params[:id])
    @product.hide!
    redirect_to :back
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :is_hidden, :style)
  end

end
