class ProductsController < ApplicationController

before_action :validate_search_key, only: [:search]

  def index
    @products = Product.where(:is_hidden =>false)
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

   def protect_them
     @product = Product.find(params[:id])
     @product.protect_them = true
     @product.save
     redirect_to :back
     flash[:notice] ="感谢你的选择！"
   end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 6 )
    end
  end

protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = {zhonglei_cont: @query_string}
  end

  def search_criteria(query_string)
    { :zhonglei_cont => query_string}
  end

end
