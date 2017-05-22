class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @photo = @product.photos.build
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id]
    if params[:photos] != nil
      @product.photos.destroy_all #need to destroy old pics first

      params[:photos]['avatar'].each do |a|
        @picture = @product.photos.create(:avatar => a)
      end

      @product.update(product_params)
              redirect_to admin_products_path

            elsif  @product.update(product_params)
              redirect_to admin_products_path
            else
              render :edit
            end
          end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end


  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
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

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :image2, :image3, :des_image, :app_image, :category_id)
  end
end
