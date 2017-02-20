class ProductsController < ApplicationController
  before_filter :authenticate_user! , only: [:favorite]
  before_action :validate_search_key, only: [:search, :category]
  before_action :validate_category_key, only: [:category]

  def index
    @products = Product.where(:is_hidden => false)
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
    if @product.is_hidden
      flash[:warning] = "产品已下架"
      redirect_to root_path
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Product.published.ransack(@search_criteria).result(:distinct => true)
      @products = search_result
    end
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

  def category
    if @cuery_string.present?
      category_result = Product.published.ransack(@category_criteria).result(:distinct => true)
      @products = category_result
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { :title_cont => query_string}
  end

  def validate_category_key
    @cuery_string = params[:c].gsub(/\\|\'|\/|\?/, "") if params[:c].present?
    @category_criteria = {category_cont: @cuery_string}
  end

  def category_criteria(cuery_string)
    { :title_cont => cuery_string}
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :is_hidden, :discount, :newproduct)
  end
end
