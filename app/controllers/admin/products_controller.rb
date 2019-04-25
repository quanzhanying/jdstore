class Admin::ProductsController < AdminController

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, alert: 'Product Deleted'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price,:image)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
