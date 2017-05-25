class ProductsController < ApplicationController

  before_action :validate_search_key, only: [:search]

  def index
    @products = Product.all.order("position ASC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    # current_cart.add_product_to_cart(@product)
    # redirect_to :back
    # flash[:notice] = "测试加入购物车"
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      # flash[:notice] = "成功加入购物车"
      flash[:notice] = "你已成功将 #{@product.name} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 8 )
    end
  end

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { :name_or_category_or_category1_or_category2_or_keyword_or_location_cont => query_string }
  end

  private

end
