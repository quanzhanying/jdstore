class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required
  def index
    @products = Product.all.order("position ASC")
    @categories = Category.all.map { |c| [c.name, c.id]}
  end

  def new
    @product = Product.new
    @categories = Category.all.map { |c| [c.name, c.id]}
    @photo = @product.photos.build
  end

  def create
    @product = Product.new(product_params)
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

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id]}
  end

  def update
    @product =Product.find(params[:id])
    @product.category_id = params[:category_id]
    if params[:photos] != nil
      @product.photos.destroy_all #如果有新参数过来，就删掉原来旧的，以新的为准
      params[:photos]['image'].each do |a|
        @photo = @product.photos.create(:image => a)
      end
      @product.update(product_params)
      redirect_to admin_products_path,notice: "更新成功!"

    elsif @product.update(product_params)
       redirect_to admin_products_path,notice: "更新成功!"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  def move_up
    @product = Product.find(params[:id])
    @product.move_higher
    redirect_to :back
  end

  def move_down
    @product = Product.find(params[:id])
    @product.move_lower
    redirect_to :back
  end

  private
  def product_params
    params.require(:product).permit(:title, :author, :description, :quantity, :price, :image, :category_id, :delivery)
  end

end
