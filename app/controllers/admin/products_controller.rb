class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @products = Product.all.paginate(:page => params[:page], :per_page =>20)
  end

  def new
    @product = Product.new
    @photo = @product.photos.build
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id]
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end


  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
    if @product.save
      redirect_to admin_products_path
    else 
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price,:promotional,:hot, :image, :image2, :image3,:image4,:image5, :des_image, :app_image, :category_id, :product_type,:data_file)
  end
end
