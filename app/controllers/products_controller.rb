class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:add_to_cart, :favorite]


  before_action :validate_search_key, only: [:search]


  def index
    @products = case params[:order]
      when 'by_upper_price'
        Product.all.order('price ASC')
      when 'by_down_price'
        Product.all.order('price DESC')
      when 'by_down_sale_count'
        Product.all.order('sale_count DESC')
     else
        Product.all.order("position ASC")
     end
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
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 5 )
    end
  end



  def category1
    @products = Product.where(:category => "category1").paginate(:page => params[:page], :per_page => 5)
  end

  def category2
    @products = Product.where(:category => "category2").paginate(:page => params[:page], :per_page => 5)
  end

  def category3
    @products = Product.where(:category => "category3").paginate(:page => params[:page], :per_page => 5)
  end

  def category4
    @products = Product.where(:category => "category4").paginate(:page => params[:page], :per_page => 5)
  end





  def favorite
    @product = product.find(params[:id])
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

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end
end
