class Admin::ProductImagesController < ApplicationController
  before_action :find_product

  def index
    @product_images = @product.product_images
  end

  def create
    params[:images].each do |image|
      @product.product_images << ProductImage.new(image: image)
    end

    redirect_to :back
  end

  def destroy
    @product_image = @product.product_images.find(params[:id])
    if @product_image.destroy
      flash[:notice] = "刪除成功"
    else
      flash[:notice] = "刪除失敗"
    end

    redirect_to :back
  end

  def update
    #取得當前圖片

    @product_image = @product.product_images.find(params[:id])
    #取得當前圖片的權重

    @product_image.weight = params[:weight]
    if @product_image.save
      flash[:notice] = "修改成功"
    else
      flash[:notice] = "修改失敗"
    end

    redirect_to :back
  end

  private
  def find_product
    @product = Product.find params[:product_id]
  end

end
