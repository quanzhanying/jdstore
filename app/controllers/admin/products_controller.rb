class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
    @photo = @product.photos.build #多图上传功能相关
    @picture = @product.pictures.build #商品详情增加多张图片功能相关
    @categories = Category.all.map { |c| [c.name, c.id] } #这一行为加入的代码
    @brands = Brand.all.map { |b| [b.name, b.id] } #这一行为加入的代码
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] } #这一行为加入的代码
    @brands = Brand.all.map { |b| [b.name, b.id] } #这一行为加入的代码
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.category_id = params[:category_id]
    @product.brand_id = params[:brand_id]
    if @product.save
      if params[:photos] != nil
        params[:photos]['avatar'].each do |a|
          @photo = @product.photos.create(:avatar => a)
        end
      if params[:pictures] != nil
        params[:pictures]['avatar'].each do |a|
          @picture = @product.pictures.create(:avatar => a)
        end
      end
      end
      redirect_to admin_products_path, alert: "添加商品成功"
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id]
    @product.brand_id = params[:brand_id]
    # 更新多张图片的判断
    if params[:photos] != nil
      @product.photos.destroy_all #需要先删除之前的所有图片
      params[:photos]['avatar'].each do |a|
        @picture = @product.photos.create(:avatar => a)
      end
    end
    # 更新多张图片的判断结束
    # 更新商品详情区域多张图片的判断
    if params[:pictures] != nil
      @product.pictures.destroy_all #需要先删除之前的所有图片
      params[:pictures]['avatar'].each do |a|
        @picnip = @product.pictures.create(:avatar => a)
      end
    end
    # 更新商品详情区域多张图片的判断结束
    @product.update(product_params)
    redirect_to admin_products_path, alert: "编辑商品成功"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, alert: "删除商品成功"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :can_sell, :new_product, :promotive_product, :image, :category_id, :brand_id, :photos, :pictures)
  end
end
