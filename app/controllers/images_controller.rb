class ImagesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @product = Product.find(params[:product_id])
    @image = Image.new
  end
  def create
    @product = Product.find(params[:product_id])
    @image = Image.new(image_params)
    @image.product = @product
    @image.user = current_user

    if @image.save
      flash[:notice] = "成功提交商品图片"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:content, :attachment)
  end

end
