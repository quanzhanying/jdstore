class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user!, only: [:favorite, :unfavorite]

  def index
    @products = Product.all.sort_by{|product| -product.fans.count}

    if params[:category].present?
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).recent
    else
      @products = case params[:order]
      when 'by_price'
        Product.all.order("price DESC")
      when 'by_fans'
        Product.all.sort_by {|product| product.fans.count}.reverse
      else
        Product.all.recent
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
    @reviews = Review.where(product_id: @product.id).order("created_at DESC")
    @review = Review.new
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).present? ? @reviews.average(:rating).round(2) : 0
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功将#{@product.title}加入购物车"
    else
      flash[:warning] = "你的购物车已有此物品"
    end
    redirect_to :back

  end

  def instant_buy
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
    else
      flash[:warning] = "你的购物车已有此物品，快去结账吧"
    end
    redirect_to carts_path
  end

  def search
    if @query_string.present?
      @products = search_params
    end

#     if @query_string.present?
#   # 显示符合关键字的公开职位 #
#   search_result = Product.ransack(@search_criteria).result(:distinct => true)
#   # @products = search_result.paginate(:page => params[:page], :per_page => 10 )
#   # 随机推荐五个职位 #
# end
  end

  def favorite
		@product = Product.find(params[:id])
		current_user.favorite_products << @product
    flash[:notice] = "您已收藏宝贝"
		redirect_to :back
	end

	def unfavorite
		@product = Product.find(params[:id])
		current_user.favorite_products.delete(@product)
    flash[:notice] = "您已取消收藏宝贝"
		redirect_to :back
	end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
  end

  private

  def search_params
    Product.ransack({:title_or_description_or_category_id_cont => @query_string}).result(distinct: true)
  end

end
