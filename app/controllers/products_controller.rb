class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]

  def  index
    @products  =  case params[:order]
            when  'high_to_low'
              Product.order('price DESC')
            when  'low_to_high'
              Product.order('price ASC')
            else
              Product.order('created_at DESC')
            end
    if params[:category].blank?
      @product = Product.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id)
    end
  end



  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)

    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice]  =  "你已成功將#{ @product.title } 加入購物車"
    else
      flash[:warning]  =  "你的購物車內已有此物品"
    end

    redirect_to :back
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 5 )
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

 private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :category_id)
  end

end
