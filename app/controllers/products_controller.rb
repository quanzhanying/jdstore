class ProductsController < ApplicationController
  before_action :validate_search_key, only:[:search]
  def index
    #分类显示
    if params[:category].blank?
      @products = Product.all
    else
      @category_id = Category.find_by(name: params[:category]).id #先找到category_id

      @products = Product.where(category_id:  @category_id) #再根据category_id找到相对应的产品。
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将#{@product.title}加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

  def search
      if @query_string.present?
        search_result = Product.ransack(@search_criteria).result(:distinct => true)
        @products = search_result
      end
  end

  protected
  #去除特殊字符
  def validate_search_key
    @query_string = params[:keyword].gsub(/\\|\'|\/|\?/, "") if params[:keyword].present?
    @search_criteria = search_criteria(@query_string)
  end
  #查询标准（可选多个查询字段）
  def search_criteria(query_string)
    { :title_or_description_cont => query_string }
  end
end
