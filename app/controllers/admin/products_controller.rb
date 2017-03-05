class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"

  def index
    @products = Product.where.not(:id => 1) #1 is a dummy product
  end

  def new
    @product = Product.new
    @product_photo = @product.product_photos.build #for multi-pics
  end

  def create
    @product = Product.create(product_params)

    if @product.save
      if params[:product_photos] != nil
        params[:product_photos]['image'].each do |a|
          @product_photo = @product.product_photos.create(:image => a)
        end
      end
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

    if params[:product_photos] != nil
      @product.product_photos.destroy_all #need to destroy old pics first

      params[:product_photos]['image'].each do |a|
        @picture = @product.product_photos.create(:image => a)
      end

      @product.update(product_params)
      redirect_to admin_products_path

    elsif @product.update(product_params)
      redirect_to admin_products_path, notice: "Product Updated."
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
    @product_photos = @product.product_photos.all
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    cart_items = CartItem.where(product_id: params[:id])
    cart_items.update_all(product_id: 1)

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
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :is_hidden, :style, :special)
  end

end
