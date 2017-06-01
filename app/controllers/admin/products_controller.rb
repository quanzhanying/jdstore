class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_categories, only: [:new, :create, :edit, :update]

  layout "admin"

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos
  end


  def new
    @product = Product.new
    @categories = Category.all.map{ |c| [c.name, c.id]}
    @photo = @product.photos.build #for multi-pics
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id] #添加的category的代码
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
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id] #添加的category的代码

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

  private

  def set_categories
    @categories = Category.all.map {|c| [c.name, c.id]}
  end

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :category_id)
  end



end
