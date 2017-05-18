class ProductsController < ApplicationController
before_action :validate_search_key, only: [:search]


  # --CRUD--
  def index
    @products = Product.all.order("position ASC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 ''#{@product.title}'' 加入购物车"
    else
      flash[:warning] = "你的购物车已有此商品"
    end
    redirect_to :back
  end


  # --search 商品搜索--

  def search
    if @query_string.present?
      @products = search_params
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
  end

  private

  def search_params
    Product.ransack({:title_or_description_or_particulars_cont => @query_string}).result(distinct: true)
  end


end
