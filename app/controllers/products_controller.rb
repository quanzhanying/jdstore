class ProductsController < ApplicationController
  before_filter :authenticate_user!, only: [:favorite]
  before_action :validate_category_key, only:[:category]

  def index
    @products = Product.all
  end
  def show
     @product = Product.find(params[:id])
     @photos = @product.photos.all
     @prints = @product.prints.all
     if @product.iwasher?
       render 'products/_iwasher'
     elsif @product.ilife?
       render 'products/ilife'
     elsif @product.mi?
       render 'products/mi'
     end

  end

  def category
     if @cuery_string.present?
       category_result = Product.ransack(@category_criteria).result(:distinct => true)
       @products = category_result
     end
  end


  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
    flash[:notice] = "你已成功将#{@product.title} 加入购物车"
  else
    flash[:warning] = "你的购物车内已有此物品"
  end
    redirect_to :back
  end

  def favorite
    @product = Product.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorite_products << @product
      redirect_to :back
    elsif type == "unfavorite"
      current_user.favorite_products.delete(@product)
      redirect_to :back
    else
      redirect_to :back
    end
  end


protected

   def validate_category_key
     @cuery_string = params[:c].gsub(/\\|\'|\/|\?/, "") if params[:c].present?
     @category_criteria = {title_cont: @cuery_string}
   end

   def category_criteria(cuery_string)
     {:title_cont => cuery_string}
   end

   private

   def product_params
     params.require(:product).permit(:title,:model,:quantity,:description,:price)
   end

end
