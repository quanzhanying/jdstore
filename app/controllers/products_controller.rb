class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]

  def index
    if params[:category].present?
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).recent
    else
      @products = case params[:order]
      when 'by_price'
          Product.all.order("price DESC")
      when 'by_like'
        Product.all.sort_by {|product| product.get_upvotes.size}.reverse
      else
        Product.all.recent
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    if @reviews.blank?
        @avg_review = 0
        @avg_look = 0
        @avg_price = 0
      else
        @avg_review = @reviews.average(:freshness).round(2)
        @avg_look = @reviews.average(:look).round(2)
        @avg_price = @reviews.average(:price).round(2)
      end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @quantity = params[:quantity].to_i
    # 判断加入购物车的商品是否超过库存
    if @quantity > @product.quantity
      @quantity = @product.quantity
      flash[:warning] = "您选择的商品数量超过库存，实际加入购物车的商品为#{@quantity}件。"
    end
    current_cart.add(@product, @quantity)
    flash[:warning] = "加入购物车的商品为#{@quantity}件。"

    redirect_to product_path(@product)
  end

#-------点赞功能-----------
  def upvote
    @product = Product.find(params[:id])
    @product.upvote_by current_user
    redirect_to :back
  end

#-------收藏的action--------
  def join
    @product = Product.find(params[:id])

     if !current_user.is_member_of?(@product)
       current_user.join!(@product)
       @product.upvote_by current_user
     end

     redirect_to product_path(@product)
   end

   def quit
     @product = Product.find(params[:id])

     if current_user.is_member_of?(@product)
       current_user.quit!(@product)
     end

     redirect_to product_path(@product)
   end
#------搜索栏------------
  def search
      if @query_string.present?
        search_result = Product.ransack(@search_criteria).result(:distinct => true)
        @products = search_result.paginate(:page => params[:page], :per_page => 10 )
      end
    end


    protected

    def validate_search_key
      @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
      @search_criteria = search_criteria(@query_string)
    end


    def search_criteria(query_string)
      { title_or_description_cont: @query_string }
    end
end
