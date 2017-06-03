class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    if params[:category].blank?
      @products = Product.all
    else
      @category_id = Category.find_by(name: params[:category]).id #先找到category_id
      @products = Product.where(category_id:  @category_id) #再根据category_id找到相对应的产品
    end
  end

  def new
    @product = Product.new
    @photo = @product.photos.build #for multi-pics
    @categories = Category.all.map { |c| [c.name, c.id] } #添加category的代码
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]  #添加category的代码

    if @product.save!
      if params[:photos] != nil
        params[:photos]['avatar'].each do |a|
          @photo = @product.photoss.create(:avatar => a)
        end
      end
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }  #添加category的代码
  end

  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id]  #添加category的代码
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

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end
end
