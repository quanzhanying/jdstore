class ProductImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"

  def index
    @product = Product.find(params[:product_id])
    @product_image = ProductImage.all
  end

  def new
    @product = Product.find(params[:product_id])
    @product_image = ProductImage.new
  end

  def create
    @product = Product.find(params[:product_id])
    @product_image = ProductImage.new(product_image_params)
    @product_image.product = @product
    if @product_image.save
      flash[:notice] = "上传高清图片成功"
      redirect_to admin_products_path(@product)

    else
      flash[:alert] = "上传失败"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @product_image = ProductImage.find(params[:id])
  end

  def update

    if params[:big_image] != nil
        @product.product_images.destroy_all #need to destroy old pics first
    end

    @product = Product.find(params[:product_id])
    @product_image = ProductImage.find(params[:id])
    @product_image.product = @product

    if @product_image.update(product_image_params)
      flash[:notice] = "上传高清图片成功"
      redirect_to admin_products_path(@product)
    else
      flash[:alert] = "上传失败"
      render :edit
    end
  end

  private

  def product_image_params
    params.require(:product_image).permit(:big_image, :product_id)
  end

end
