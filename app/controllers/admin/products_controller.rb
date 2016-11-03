class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user! , only:[:new, :create, :edit, :update, :destroy]
  before_filter :admin_require
  layout "admin"
  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all.recent
  end

  def new
    @product = Product.new
    @photo = @product.photos.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params[:photos] != nil
        params[:photos]['avatar'].each do |a|
          @photo = @product.photos.create(:avatar => a)
        end
      end
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
     @product = Product.find(params[:id])

     if params[:photos] != nil
       @product.photos.destroy_all #need to destroy old pics first

       params[:photos]['avatar'].each do |a|
         @picture = @product.photos.create(:avatar => a)
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
    redirect_to admin_products_path
  end

  def publish
    @product = Product.find(params[:id])
    @product.publish!
    redirect_to admin_products_path
  end

  def hide
    @product = Product.find(params[:id])
    @product.hide!
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :is_hidden)
  end
end
