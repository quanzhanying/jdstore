class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]

  respond_to :js

  def index
    # @products = Product.all
    if params[:category].blank?
      @products = Product.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
   if !current_cart.products.include?(@product)
     current_cart.add_product_to_cart(@product)
     @product.quantity -= @product.buying_quantity
     @product.buying_quantity = 1
     @product.save
     flash[:notice] = "你已成功将 《#{@product.title}》 加入购物车"
   else
     flash[:warning] = "你的购物车内已有 《#{@product.title}》"
   end
    redirect_to :back
    # respond_to do |format|
    #   format.js   { render :layout => false }
    # end
  end

  def add_buying_quantity
    @product = Product.find(params[:id])
    if @product.buying_quantity <= @product.quantity
      @product.buying_quantity +=1
      @product.save
      # redirect_to :back
      respond_to do |format|
        format.js   { render :layout => false }
      end
    end
  end

  def remove_buying_quantity
    @product = Product.find(params[:id])
    if @product.buying_quantity > 1
      @product.buying_quantity -= 1
      @product.save
      # redirect_to :back
      respond_to do |format|
        format.js   { render :layout => false }
      end
    end
end

# 搜索 #
def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 5)
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
