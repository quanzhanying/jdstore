class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]

  def index
    if params[:category].present?
       @category = params[:category]
       if @category == '所有商品'
         @products = Poduct.published.recent.paginate(:page => params[:page], :per_page => 5)
       else
         @products = Product.published.where(:category => @category).recent.paginate(:page => params[:page], :per_page => 5)
       end
    else
        @products = case params[:order]
                  when 'down_product.price'
                    Product.published.order('price DESC').paginate(:page => params[:page], :per_page => 5)
                  when 'up_product.price'
                    Product.published.order('price ASC').paginate(:page => params[:page], :per_page => 5)
                  else
                    Product.published.recent.paginate(:page => params[:page], :per_page => 5)
                  end
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

  def upvote
    @product = Product.find(params[:id])
    @product.upvote_by current_user
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
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")
    if params[:q].present?
      @search_criteria =  { title_or_description_cont: @query_string }
    end
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image, :category, :is_hidden)
  end

end
