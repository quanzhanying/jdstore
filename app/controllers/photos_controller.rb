class PhotosController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.find(params[:id])
    @photo = Photo.new
  end

  def create
      @product = Product.find(params[:product_id])
      @photo = Photo.new(photo_params)
      @photo.product = @product
      @photo.user = current_user

      if @photo.save

        redirect_to product_path(@product)
      else
        render :new
      end
    end

    private

    def photo_params
      params.require(:photo).permit(:content,:attachment)
    end
  end
end
