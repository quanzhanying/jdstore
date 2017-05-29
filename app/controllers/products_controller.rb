class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]

  def index
    @products = Product.order("position ASC")
  end

  def show
    @product = Product.find(params[:id])
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
     if @query_string.present? && !@query_string.blank?
       search_result = Product.ransack(@search_criteria).result(:distinct => true)
       @products = search_result.paginate(:page => params[:page], :per_page => 5 )
       if @products.blank?
         redirect_to root_path, alert: "没有找到相关工作信息！"
       end
     else
       redirect_to root_path, notice: "搜索信息不能为空，请输入关键字搜索！"
     end
  end


  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end


end
