class Admin::ProductsController < ApplicationController


  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    if params[:category].blank?
      @products = Product.all.recent
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).recent
    end
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
  end

  def new
    @product = Product.new
    @categories = Category.all.map { |c| [c.name, c.id] }
    @photo = @product.photos.build
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @product = Product.create(product_params)
    @product.category_id = params[:category_id]
    if @product.save
      if params[:photos] != nil
        params[:photos]['image'].each do |a|
          @photo = @product.photos.create(:image => a)
        end
      end
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id]
    if params[:photos] != nil
      @product.photos.destroy_all
      params[:photos]['image'].each do |a|
        @picture = @product.photos.create(:image => a)
      end
      @product.update(product_params)
      redirect_to admin_products_path

    elsif @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = "Product Deleted"
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :category_id, :size)
  end
end
