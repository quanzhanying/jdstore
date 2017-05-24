class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required

  def index
      @products = Product.includes(:photos).includes(:category).all
  end

  def new
    @product = Product.new
    @categories = Category.all.map { |c| [c.name, c.id] } #用来选择类别
    @photo = @product.photos.build #for multi-pics
    @introduce_picture = @product.introduce_pictures.build #for multi-pics
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]

    if @product.save
       if params[:photos] != nil
         params[:photos]['avatar'].each do |a|
         @photo = @product.photos.create(:avatar => a)
       end
       if params[:introduce_pictures] != nil
         params[:introduce_pictures]['avatar'].each do |a|
           @introduce_picture = @product.introduce_pictures.create(:avatar => a)
       end
     end
     end
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] } #用来选择类别
  end

  def update
     @product = Product.find(params[:id])
     @product.category_id = params[:category_id]
     if params[:photos] != nil
         @product.photos.destroy_all #need to destroy old pics first
         params[:photos]['avatar'].each do |a|
          @ohoto = @product.photos.create(:avatar => a)
       end
     end
      if params[:introduce_pictures] != nil
          @product.introduce_pictures.destroy_all #need to destroy old pics first

          params[:introduce_pictures]['avatar'].each do |a|
          @introduce_picture = @product.introduce_pictures.create(:avatar => a)
        end
      end
       @product.update(product_params)
       redirect_to admin_products_path
   end

  def destory
    @product = Product.find(params[:id])
    @product.destory
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit(:title,:description,:quantity,:price,:image,:category,:category_id)
  end
end
